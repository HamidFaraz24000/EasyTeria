import connection as cn


def login(user, password, desg):
    sql = "SELECT * FROM admins WHERE UserName like %s and Designation like %s"
    adr = (user, desg, )

    state.execute(sql, adr)
    result = state.fetchone()
    if result == None:
        return 0
    else:
        sql2 = "SELECT * FROM admins WHERE UserName like %s and Password like %s and Designation like %s"
        adr2 = (user, password, desg,)

        state.execute(sql2, adr2)
        result = state.fetchone()
        if result == None:
            return 1
        else:
            return 2


db = cn.connect()
state = db.cursor()


if __name__ == "__main__":
    print(login("MID@89PK", "Tree456", "Head Admin"))
