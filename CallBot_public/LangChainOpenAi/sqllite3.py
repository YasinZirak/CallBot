import sqlite3
from pyodbc import ProgrammingError
from langchain.utilities import SQLDatabase
from langchain.llms import OpenAI
from langchain_experimental.sql import SQLDatabaseChain
import os
import dotenv
dotenv.load_dotenv()
OpenAI.openai_api_key = os.environ.get("OPENAI_API_KEY")


def create_connection(db_file):

    conn = None
    try:
        conn = sqlite3.connect(db_file)
        return conn
    except ProgrammingError as e:
        print(e)

    return conn


def create_table(conn, create_table_sql):
    try:
        c = conn.cursor()
        c.execute(create_table_sql)
    except ProgrammingError as e:
        print(e)


def main():
    # database = r"D:\PythonExample\Sqllite\pythonsqlite.db"
    database = r"pythonsqlite.db"

    with open('dbScript.sql', 'r', encoding="ISO-8859-1") as sql_file:
        sql_script = sql_file.read()

    conn = create_connection(database)
    cursor = conn.cursor()
    cursor.executescript(sql_script)


def db_response(message):
    db = SQLDatabase.from_uri("sqlite:///pythonsqlite.db")
    llm = OpenAI(temperature=0, verbose=True)
    db_chain = SQLDatabaseChain.from_llm(
        llm, db, verbose=True, use_query_checker=True, return_intermediate_steps=True, top_k=300)

    result = db_chain(message)
    print("********************************************************")
    print(f" \n User:  {result['query']}")
    print(f" \n Assistant:  {result['result']}")
    print("********************************************************\n")


if __name__ == '__main__':
    main()

    message = input("Hello please ask you'r question: \n")
    db_response(message)
try:
    sqliteConnection = sqlite3.connect(
        "pythonsqlite.db")

    cursor = sqliteConnection.cursor()

except sqlite3.Error as error:
    print('failed to execute:', error)
finally:
    if sqliteConnection:
        sqliteConnection.close()
