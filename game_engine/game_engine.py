from PySide2.QtCore import Slot
from PySide2.QtQuick import QQuickView

from game_engine.grid import Grid


class GameEngine(QQuickView):
    def __init__(self, window_handler):
        super().__init__()
        self.rootContext().setContextProperty("MainWindow", self)
        self.setResizeMode(QQuickView.SizeRootObjectToView)
        self.x_score = 0
        self.o_score = 0
        self.elapsed_time = 0
        self.used_grid = []
        self.window_handler = window_handler

    @Slot(int, int, result=str)
    def next_move(self, x, y):
        if [x, y] in self.used_grid or self.used_grid == ["over"]:
            return self.grid.get_value(x, y)
        else:
            self.used_grid.append([x, y])
            return_value = self.grid.get_next_player()

            if self.grid.take_turn(x, y):
                self.handle_the_end()

            return return_value

    @Slot(result=str)
    def handle_the_end(self):
        self.used_grid = ["over"]
        result = self.grid.get_end_result()
        if result != "DRAW":
            if "X" in result:
                self.x_score += 1
            else:
                self.o_score += 1

    @Slot(result=int)
    def get_x_score(self):
        return self.x_score

    @Slot(result=int)
    def get_o_score(self):
        return self.o_score

    @Slot()
    def restart(self):
        self.used_grid = []
        self.grid.restart()

    @Slot()
    def reset_score(self):
        self.x_score = 0
        self.o_score = 0

    @Slot(result=str)
    def get_next_message(self):
        return self.grid.get_next_message()

    @Slot(result=str)
    def get_elapsed_time(self):
        hours = int(self.elapsed_time/60/60)
        minutes = int((self.elapsed_time-(hours*60*60))/60)
        seconds = self.elapsed_time-(hours*60*60)-(minutes*60)

        self.elapsed_time += 1
        if hours > 9 and minutes > 9 and seconds > 9:
            return f"{hours}:{minutes}:{seconds}"
        if hours > 9 and minutes > 9:
            return f"{hours}:{minutes}:0{seconds}"
        if hours > 9 and seconds > 9:
            return f"{hours}:0{minutes}:{seconds}"
        if hours > 9:
            return f"{hours}:0{minutes}:0{seconds}"

        if hours <= 9 and minutes <= 9 and seconds <= 9:
            return f"0{hours}:0{minutes}:0{seconds}"
        if hours <= 9 and minutes <= 9:
            return f"0{hours}:0{minutes}:{seconds}"
        if hours <= 9 and seconds <= 9:
            return f"0{hours}:{minutes}:0{seconds}"
        if hours <= 9:
            return f"0{hours}:{minutes}:{seconds}"

    @Slot()
    def reset_time(self):
        self.elapsed_time = 0

    @Slot()
    def back_to_start_screen(self):
        self.window_handler.show_start_screen()

    @Slot(int, int, result=str)
    def get_back_position(self, x, y):
        return self.grid.get_value(x, y)
