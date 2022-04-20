import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle{
        id: main_window

        implicitWidth: 700
        implicitHeight: 750
        visible: true

        color: "#1D84B5"

        Button{
            x: main_window.width*0.2857
            y: main_window.height*0.2533
            width: main_window.width*0.4285
            height: main_window.height*0.1333
            clip: true

            background: Rectangle{
                color:
                    parent.hovered ? "#8edbf6" : "#53a2be"
            }
            Text{
                text: "1 vs 1"
                anchors.fill: parent
                font.pointSize: 200
                fontSizeMode: Text.Fit
                            color: "white"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter

                        }
            onClicked: {
                StartScreen.one_on_one()

            }
        }

        Button {
            x: main_window.width*0.2857
            y: main_window.height*0.6
            width: main_window.width*0.4285
            height: main_window.height*0.1333
            clip: true
            background: Rectangle {
                color: parent.hovered ? "#8edbf6" : "#53a2be"
            }

            Text{
                text: "1 vs AI"
                anchors.fill: parent
                font.pointSize: 200
                fontSizeMode: Text.Fit
                            color: "white"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter

                        }
            onClicked: {
                StartScreen.one_vs_ai()

            }
        }

}
