from PySide2.QtCore import QUrl, Slot
from PySide2.QtQuick import QQuickView


class StartScreen(QQuickView):
    def __init__(self, window_handler):
        super().__init__()
        self.setSource(QUrl('./gui/start_screen.qml'))
        self.rootContext().setContextProperty("StartScreen", self)
        self.setResizeMode(QQuickView.SizeRootObjectToView)
        self.__window_handler = window_handler

    @Slot()
    def one_on_one(self):
        self.__window_handler.show_1v1()

    @Slot()
    def one_vs_ai(self):
        self.__window_handler.show_settings()



