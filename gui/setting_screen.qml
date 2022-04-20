import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

Rectangle{
        id: main_window
        property string player_checked: "X"
        implicitWidth: 700
        implicitHeight: 750
        visible: true

        color: "#1D84B5"
    
         Label{

             x: main_window.width*0.042
             y: main_window.height*0.1226
             width: main_window.width*0.4114
             height: main_window.height*0.1826
             color: "#000000"
             clip: true
         Text{
             anchors.fill:parent
             font.pointSize: 20
             text:  qsTr("Choose who to play as (X always starts in tictactoe)")
             wrapMode: Text.WordWrap
             color: "white"
             fontSizeMode: Text.Fit
         }
         }

         Label{

             x: main_window.width*0.042
             y: main_window.height*0.38
             width: main_window.width*0.4114
             height: main_window.height*0.1826
             color: "#000000"
             clip: true
         Text{
             anchors.fill:parent
             font.pointSize: 20
             text:  qsTr("Choose difficulty")
             wrapMode: Text.WordWrap
             color: "white"
             fontSizeMode: Text.Fit
         }
         }





    Rectangle{
        x: main_window.width*0.5071
        y: main_window.height*0.1226
        width: 282*0.40285
        height: 56*0.07466
        color: "#1D84B5"

        Text{
            x: 5
            y: -3
            width: 191
            height: 48
            color: "#ffffff"
            text:"Play as X"
            font.pointSize: 30
            fontSizeMode: Text.Fit
        }

        CheckBox{
            id: x_box
            x: 226
            y: 12
            width: 38
            height: 33
            anchors.right: Rectangle.right
            checked: true
            onCheckStateChanged: (x_box.checked == true) ?   o_box.checked = false : o_box.checked = true

        }


    }

    Rectangle{
        x: main_window.width*0.5071
        y: main_window.height*0.2186
        width: main_window.width*0.4028
        height: main_window.height*0.07466
        color: "#1D84B5"

        Text{
            x: 5
            y: -3
            width: 191
            height: 48
            color: "#ffffff"
            text:"Play as O"
            font.pointSize: 30
            fontSizeMode: Text.Fit
        }

        CheckBox{
            id:o_box
            x: 226
            y: 15
            width: 38
            height: 33
            anchors.right: Rectangle.right
            onCheckStateChanged: (o_box.checked == true) ?   x_box.checked = false : x_box.checked = true

        }


    }

    Rectangle {
        x: main_window.width*0.5071
        y: main_window.height*0.3666
        width: 282*0.40285
        height: 56*0.07466
        color: "#1d84b5"
        Text {
            x: 5
            y: -3
            width: 191
            height: 48
            color: "#ffffff"
            text: "Hard"
            font.pointSize: 30
            fontSizeMode: Text.Fit
        }

        CheckBox {
            id: hard_box
            x: 226
            y: 15
            width: 38
            height: 33
            anchors.right: Rectangle.right
            checkState: "Checked"
            checkable: false

        }
    }

    Button {
        id: continue_button
        x: main_window.width*0.04285
        y: main_window.height*0.6333
        width: main_window.width*0.84
        height: main_window.height*0.08
        clip: true
        background: Rectangle {
            color: parent.hovered ? "#8edbf6" : "#53a2be"
        }
        enabled: false

        Text{
            text: "Continue previous game with previous settings"
            anchors.fill: parent
            font.pointSize: 200
            fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                    }
        onClicked: {
             SettingScreen.one_vs_ai_continue()

        }
    }

    Button {
        x: main_window.width*0.04285
        y: main_window.height*0.76666
        width: main_window.width*0.84
        height: main_window.height*0.08
        clip: true
        background: Rectangle {
            color: parent.hovered ? "#8edbf6" : "#53a2be"
        }

        Text{
            text: "Start new game with these new settings"
            anchors.fill: parent
            font.pointSize: 200
            fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                    }
        onClicked: {
             continue_button.enabled = true
             SettingScreen.one_vs_ai_new(x_box.checked, hard_box.checked)

        }
    }

    Button {
        x: main_window.width*0.04285
        y: main_window.height*0.9
        width: main_window.width*0.84
        height: main_window.height*0.08
        clip: true
        background: Rectangle {
            color: parent.hovered ? "#8edbf6" : "#53a2be"
        }

        Text{
            text: "Back to start screen"
            anchors.fill: parent
            font.pointSize: 200
            fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                    }
        onClicked: {
            SettingScreen.back_to_start_screen()

        }
    }



}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}D{i:11}
}
##^##*/
