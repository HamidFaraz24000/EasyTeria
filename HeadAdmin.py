import sys
from PyQt5.uic import loadUi
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QDialog, QApplication, QWidget
import admin_funcs as af


class WelcomeScreen(QDialog):
    def __init__(self):
        super(WelcomeScreen, self).__init__()
        loadUi("Head_Admin_welcome.ui", self)
        self.password.setEchoMode(QtWidgets.QLineEdit.Password)
        self.loginbtn.clicked.connect(self.callLogin)

    def callLogin(self):
        uname = self.username.text()
        password = self.password.text()

        if len(uname) == 0 or len(password) == 0:
            self.error.setText("Please fill all fields.")
        else:
            val = af.login(uname, password, "Head Admin")
            if val == 0:
                self.error.setText("Wrong username, please try again")
            elif val == 1:
                self.error.setText("Wrong Password, please try again")
            else:
                Ms = MainScreen()
                widget.addWidget(Ms)
                widget.setCurrentIndex(widget.currentIndex()+1)
                widget.setWindowTitle("Main Screen")


class MainScreen (QDialog):

    def __init__(self):
        super(MainScreen, self).__init__()
        loadUi("Head_Admin_main.ui", self)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    Ws = WelcomeScreen()
    widget = QtWidgets.QStackedWidget()
    widget.addWidget(Ws)
    widget.setFixedHeight(500)
    widget.setFixedWidth(800)
    widget.setWindowTitle("Login")
    widget.show()
    try:
        sys.exit(app.exec_())
    except:
        pass
