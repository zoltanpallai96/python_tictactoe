from PySide2.QtCore import QUrl, Slot

from game_engine.AI import GridWithAI
from game_engine.game_engine import GameEngine


class Engine1vai(GameEngine):
    def __init__(self, window_handler, play_as = "X", hard_difficulty = True):
        super().__init__(window_handler)
        self.grid = GridWithAI(play_as)
        self.setSource(QUrl('./gui/Main_window_1vai.qml'))

    @Slot()
    def move_ai(self):
        if self.grid.ai_move():
            self.handle_the_end()
