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
        top_k=3)

    result = db_chain(message)

    # print("--------------------------------------------------")
    # print(f">> {result['query']}")
    # print(f">>> {result['result']}")
    # return '(db) '+result['result']
    return result['result']


def welcoming():
    welcome_text = '''
    Hello and welcome to Semantix.This is an AI assistant. 
    If you at any point you wish to speak with a human representative, 
     you can press 1 anytime during the call. How can I assist you?
    '''
    Speech.text_to_speech(welcome_text)


def main_run():
    delimiter = "####"
    system_message = f"""
                              You are a friendly AI assistant with just one sentence answer and under 20 words.\ 
                              you mainly focus on booking interpretor service call: \                            
                              then return the "database" keyword.\
                              if a user says exit, stop,quit keywords just return False\
                              The customer service query will be delimited with {delimiter} characters.\
                              During the conversation, it's important to inquire about the \
                              duration of the interpreter's needed service and \
                              whether they prefer phone, video, or onsite interpretation.\
                              If the user intends to book an interpreter, request their customer ID, \
                              and if they choose the onsite method, inquire whether they require the 
                              interpreter to be present at the specified address that linked to the previous address.
                              """

    messages = [{'role': 'system',
                'content': system_message
                 }]
    # -------------------------------------------------------------------
    exp = True
    con_num_limit = 6
    i = 0

    content = ''
    while exp:
        content = Speech.recognize_from_microphone()
        user_content = {'role': 'user',
                        'content': f"{delimiter}{content}{delimiter}"}
        messages.append(user_content)

        response = get_completion_from_messages(messages)
        if response == 'Database.' or response == 'database':
            response = db_response(content)
        # response = db_response(content)

        assistant_content = {'role': 'assistant', 'content': response}
        print('>> ', response)
        if response != 'False':
            Speech.text_to_speech(response)

        messages.append(assistant_content)

        if i == con_num_limit or response == 'False':
            exp = False
        i += 1
    return messages


if __name__ == '__main__':
    sqllite.execute_script()
    print('\n' * 5, '----------------- Conversation Starting -------------------\n')
    welcoming()
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
