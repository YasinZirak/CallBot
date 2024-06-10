from langchain.utilities import SQLDatabase
from langchain.llms import OpenAI
import openai
from langchain_experimental.sql import SQLDatabaseChain
import os
import dotenv
import sqllite
import Speech

dotenv.load_dotenv()
OpenAI.openai_api_key = os.environ.get("OPENAI_API_KEY")


def get_completion_from_messages(messages, model="gpt-3.5-turbo", temperature=0):
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=temperature,
    )
    return response.choices[0].message["content"]


def db_response(message):
    db = SQLDatabase.from_uri("sqlite:///pythonsqlite.db")
    llm = OpenAI(temperature=0, verbose=True)
    db_chain = SQLDatabaseChain.from_llm(
        llm,
        db,
        verbose=False,
        use_query_checker=True,
        return_intermediate_steps=True,
        top_k=5)

    result = db_chain(message)

    # print("--------------------------------------------------")
    # print(f">> {result['query']}")
    # print(f">>> {result['result']}")
    return '(db) '+result['result']


def main_run():
    messages = [{'role': 'system',
                'content': '''You are friendly chatbot with just one sentence answer and under 10 words.\ 
                you mainly focus on car rental if you had no answer for a question and \
                the posibility of refering to database is high just return database keyword\
                with the exit,stop,quit keywords just return False'''}]
    # -------------------------------------------------------------------
    exp = True
    con_num_limit = 10
    i = 0

    content = ''
    while exp:
        content = Speech.recognize_from_microphone()
        user_content = {'role': 'user', 'content': content}
        messages.append(user_content)

        response = get_completion_from_messages(messages)
        if response == 'Database.':
            response = db_response(content)

        assistant_content = {'role': 'assistant', 'content': response}
        print('>> ', response)
        messages.append(assistant_content)

        if i == con_num_limit or response == 'False':
            exp = False
        i += 1
    return messages


if __name__ == '__main__':
    sqllite.execute_script()
    print('\n' * 5, '----------------- Conversation Starting -------------------\n')
    messages = main_run()
    print('---------------------------------------------------------')

try:
    sqliteConnection = sqllite.sqlite3.connect("pythonsqlite.db")

    cursor = sqliteConnection.cursor()

except sqllite.sqlite3.Error as error:
    print('failed to execute:', error)
finally:
    if sqliteConnection:
        sqliteConnection.close()
