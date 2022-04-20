from PySide2.QtCore import QUrl, Slot
from PySide2.QtQuick import QQuickView


class SettingScreen(QQuickView):
    def __init__(self, window_handler):
        super().__init__()
        self.setSource(QUrl('./gui/setting_screen.qml'))
        self.rootContext().setContextProperty("SettingScreen", self)
        self.setResizeMode(QQuickView.SizeRootObjectToView)
        self.__window_handler = window_handler

    @Slot()
    def one_vs_ai_continue(self):
        self.__window_handler.show_1vai()

    @Slot(bool, bool)
    def one_vs_ai_new(self, play_as_x, hard_difficulty = True):
        self.__window_handler.show_1vai(play_as_x, hard_difficulty, True)

    @Slot()
    def back_to_start_screen(self):
        self.__window_handler.show_start_screen()
