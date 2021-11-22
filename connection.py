import mysql.connector


def connect():
    myDB = "null"
    try:
        myDB = mysql.connector.connect(host="localhost", database="easyteria", user="root",
                                       password="")
    except:
        print("Error in connecting to Database")

    return myDB
