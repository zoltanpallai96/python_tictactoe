import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle{
        id: main_window

        implicitWidth: 700
        implicitHeight: 750
        visible: true

        property int xscore: 0
        property int oscore: 0

        color: "#1D84B5"


        Rectangle{

            x: main_window.width*0.0371
            y: main_window.height*0.048


           width: main_window.width*0.2
           height: main_window.height*0.2
           color: "#00ffffff"

                Text{
                    text: "X's score:"
                    color: "white"
                    anchors.fill: parent
                    font.pointSize: 75
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
        }

        Rectangle{
            id: xscore

            x: main_window.width*0.1914
            y: main_window.height*0.048


           width: main_window.width*0.2
           height: main_window.height*0.2
           color: "#00ffffff"
           clip: true

                Text{
                    text: main_window.xscore
                    color: "white"
                    anchors.fill: parent
                    font.pointSize: 35
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
        }

        Rectangle{
            x: main_window.width*0.4
            y: main_window.height*0.048


           width: main_window.width*0.2
           height: main_window.height*0.2
           color: "#00ffffff"

                Text{
                    text: "O's score:"
                    color: "white"
                    anchors.fill: parent
                    font.pointSize: 75
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
        }

        Rectangle{
            id: oscore
            x: main_window.width*0.5571
            y: main_window.height*0.048


           width: main_window.width*0.2
           height: main_window.height*0.2
           color: "#00ffffff"
           clip: true

           Text{
                    text: main_window.oscore
                    color: "white"
                    anchors.fill: parent
                    font.pointSize: 35
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
        }

        Rectangle{
            property string mytext: "X is next"
            id: result
            x: main_window.width*0.105
            y: main_window.height*0.189
            width: main_window.width*0.617
            height: main_window.height*0.066


           color: "#00ffffff"
           clip: true

           Text{
                    text: result.mytext
                    color: "white"
                    anchors.fill: parent
                    font.pointSize: 20
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
        }

        Rectangle{
            property string mytext: "00:00:00"
            id: time_display
            x: main_window.width*0.571
            y: main_window.height*0.08
            width: main_window.width*0.617
            height: main_window.height*0.066


           color: "#00ffffff"
           clip: true

           Item {
               Timer { // @disable-check M300
                   id: elapsed_time
                   running: true
                   repeat: (result.mytext.includes("game is over")) ? false : true
                   onTriggered: time_display.mytext = MainWindow.get_elapsed_time()

                   }
               }
           Text{
                    text: time_display.mytext
                    color: "white"
                    anchors.fill: parent
                    font.pointSize: 35
                    fontSizeMode: Text.Fit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
        }


        GridLayout {
            id: gridLayout
            x: main_window.width*0.0114
            y: main_window.height*0.2026

            width: main_window.width*0.9828
            height: main_window.height*0.7866

            columnSpacing: parent.width*-0.2142
            rowSpacing: parent.height*-0.1333
            columns: 3
            rows: 3

                 Rectangle{
                    property string mytext
                    id: button00
                    Layout.preferredWidth: main_window.width*0.2314
                    Layout.preferredHeight: main_window.height*0.2104
                    color: "#0A2239"

                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }                    
                    MouseArea{
                        onClicked:{
                            parent.mytext = MainWindow.next_move(0,0)                            
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()


                        }

                        anchors.fill: parent
                    }
                    }

                Rectangle{
                    property string mytext

                    Layout.preferredWidth: main_window.width*0.2314
                    Layout.preferredHeight: main_window.height*0.2104

                    color: "#0A2239"
                    id: button01

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(0,1)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }
                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }
                    }

           Rectangle{
               property string mytext


               Layout.preferredWidth: main_window.width*0.2314
               Layout.preferredHeight: main_window.height*0.2104

                    color: "#0A2239"
                    id: button02

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(0,2)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }


                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }
                    }

            Rectangle{
                property string mytext
                id: button10
                Layout.preferredWidth: main_window.width*0.2314
                Layout.preferredHeight: main_window.height*0.2104
                   color: "#0A2239"

                   MouseArea{
                       onPressed: {
                           parent.mytext= MainWindow.next_move(1,0)
                           main_window.xscore = MainWindow.get_x_score()
                           main_window.oscore = MainWindow.get_o_score()
                           result.mytext = MainWindow.get_next_message()
                       }

                       anchors.fill: parent
                   }


                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }
                    }
            Rectangle{
                property string mytext


                Layout.preferredWidth: main_window.width*0.2314
                Layout.preferredHeight: main_window.height*0.2104

                    color: "#0A2239"
                    id: button11

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(1,1)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }


                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }
                    }
            Rectangle{
                property string mytext


                Layout.preferredWidth: main_window.width*0.2314
                Layout.preferredHeight: main_window.height*0.2104
                id: button12
                    color: "#0A2239"

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(1,2)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }

                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }
                    }

            Rectangle{
                property string mytext

                id: button20
                Layout.preferredWidth: main_window.width*0.2314
                Layout.preferredHeight: main_window.height*0.2104

                    color: "#0A2239"

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(2,0)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }

                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text:  parent.mytext

                    }
                    }
            Rectangle{
                property string mytext

                id: button21
                Layout.preferredWidth: main_window.width*0.2314
                Layout.preferredHeight: main_window.height*0.2104

                    color: "#0A2239"

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(2,1)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }


                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter                        
                        text:  parent.mytext

                    }
                    }
            Rectangle{
                property string mytext

                id: button22
                Layout.preferredWidth: main_window.width*0.2314
                Layout.preferredHeight: main_window.height*0.2104

                    color: "#0A2239"

                    MouseArea{
                        onPressed: {
                            parent.mytext= MainWindow.next_move(2,2)
                            main_window.xscore = MainWindow.get_x_score()
                            main_window.oscore = MainWindow.get_o_score()
                            result.mytext = MainWindow.get_next_message()
                        }

                        anchors.fill: parent
                    }


                    Text{
                        anchors.fill: parent
                        font.pointSize: 75
                        fontSizeMode: Text.Fit
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter                        
                        text:  parent.mytext

                    }
                    }

           }
        Button{
            x:main_window.width*0.7671
            y: main_window.height*0.3466
            width: main_window.width*0.2214
            height: main_window.height*0.088
            flat: true
            clip: true

            background: Rectangle{
                color:
                    parent.hovered ? "#8edbf6" : "#53a2be"
            }
            Text{
                text: "Restart"
                anchors.fill: parent
                font.pointSize: 200
                fontSizeMode: Text.Fit
                color: "white"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }
            onClicked: {
                button00.mytext = " "
                button01.mytext = " "
                button02.mytext = " "
                button11.mytext = " "
                button12.mytext = " "
                button10.mytext = " "
                button20.mytext = " "
                button21.mytext = " "
                button22.mytext = " "
                MainWindow.restart()
                result.mytext = MainWindow.get_next_message()
                MainWindow.reset_time()
                elapsed_time.restart()
            }
        }

       Button {
            id: reset_score
            x: main_window.width*0.7671
            y: main_window.height*0.5613
            width: main_window.width*0.2214
            height: main_window.height*0.088
            flat: true
            clip: true
            background: Rectangle{
                color:
                    parent.hovered ? "#8edbf6" : "#53a2be"
            }

            Text {
                text: "Reset Score"
                color: "white"
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 200
                fontSizeMode: Text.Fit
            }

            onClicked: {
                MainWindow.reset_score()
                main_window.xscore = MainWindow.get_x_score()
                main_window.oscore = MainWindow.get_o_score()

            }
        }

       Button {
            id: back_to_start_screen
            x: main_window.width*0.7671
            y: main_window.height*0.7613
            width: main_window.width*0.2214
            height: main_window.height*0.088
            flat: true
            clip: true
            background: Rectangle{
                color:
                    parent.hovered ? "#8edbf6" : "#53a2be"
            }

            Text {
                text: "Back"
                color: "white"
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 200
                fontSizeMode: Text.Fit
            }

            onClicked: {
                MainWindow.back_to_start_screen()

            }
        }

    }
