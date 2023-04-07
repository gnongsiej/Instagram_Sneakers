import pyodbc


def connect_to_database():
    server = 'localhost'
    database = 'instagram'

    connection_string = 'DRIVER={ODBC Driver 18 for SQL Server};' \
                        + 'SERVER=' + server + ';' \
                        + 'DATABASE=' + database + ';' \
                        + 'ENCRYPT=no;' \
                        + 'trusted_connection=yes;'
    connection = pyodbc.connect(connection_string)
    connection.setdecoding(pyodbc.SQL_CHAR, encoding='utf8')
    connection.setdecoding(pyodbc.SQL_WCHAR, encoding='utf8')
    connection.setencoding(encoding='utf8')
    cursor = connection.cursor()
    return cursor
