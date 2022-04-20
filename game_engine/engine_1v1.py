from PySide2.QtCore import QUrl

from game_engine.game_engine import GameEngine
from game_engine.grid import Grid


class Engine1v1(GameEngine):
    def __init__(self, window_handler):
        super().__init__(window_handler)
        self.grid = Grid()
        self.setSource(QUrl('./gui/Main_window_1v1.qml'))






