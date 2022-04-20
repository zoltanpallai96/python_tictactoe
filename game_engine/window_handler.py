from game_engine.engine_1v1 import Engine1v1
from game_engine.engine_1vai import Engine1vai
from game_engine.setting_screen import SettingScreen
from start_screen import StartScreen


class WindowHandler:

    def __init__(self):
        self.__start_screen = StartScreen(self)
        self.__window_1v1 = Engine1v1(self)
        self.__setting_screen = SettingScreen(self)
        self.__window_1vai = None

        self.__start_screen.show()

    def show_start_screen(self):
        self.__start_screen.show()
        self.__window_1v1.close()
        self.__window_1vai.close()
        self.__setting_screen.close()

    def show_1v1(self):
        self.__window_1v1.show()
        self.__start_screen.close()

    def show_settings(self):
        self.__setting_screen.show()
        self.__start_screen.close()

    def show_1vai(self, play_as_x=True, hard_difficulty=True, new_game=False):
        if new_game:
            if play_as_x:
                self.__window_1vai = Engine1vai(self, "O", hard_difficulty)
            else:
                self.__window_1vai = Engine1vai(self, "X", hard_difficulty)
        self.__window_1vai.show()
        self.__setting_screen.close()






