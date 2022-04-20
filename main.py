import sys
from PySide2.QtWidgets import QApplication
from game_engine.window_handler import WindowHandler

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window_handler = WindowHandler()
    sys.exit(app.exec_())



