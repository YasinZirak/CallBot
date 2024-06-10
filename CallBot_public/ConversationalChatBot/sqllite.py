import sqlite3
from pyodbc import ProgrammingError


def create_connection(db_file):

    conn = None
    try:
        conn = sqlite3.connect(db_file)
        return conn
    except ProgrammingError as e:
        print(e)

    return conn


def execute_script():
    # database = r"D:\PythonExample\Sqllite\pythonsqlite.db"
    database = r"pythonsqlite.db"

    with open('dbScript.sql', 'r', encoding="ISO-8859-1") as sql_file:
        sql_script = sql_file.read()

    conn = create_connection(database)
    cursor = conn.cursor()
    cursor.executescript(sql_script)
