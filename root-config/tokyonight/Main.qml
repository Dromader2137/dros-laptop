import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

Rectangle {
    property int sessionIndex: session.index

    width: 640
    height: 480
    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true
    Component.onCompleted: {
        if (user_entry.text === "")
            user_entry.focus = true;
        else
            pw_entry.focus = true;
    }

    Connections {
        target: sddm
        onLoginSucceeded: {
        }
        onInformationMessage: {
        }
        onLoginFailed: {
            pw_entry.text = "";
        }
    }

    Image {
        id: backgroundImage

        anchors.fill: parent
        source: "images/background.png"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.fill: parent
        color: "#00000000"

        Rectangle {
            width: 620
            height: 1080
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: "#d01a1b28"

            Item {
                anchors.margins: 20
                anchors.fill: parent

                Column {
                    anchors.centerIn: parent
                    spacing: 30

                    Column {
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text {
                            id: timeText

                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignCenter
                            color: "#a9b1d6"
                            font.bold: true
                            font.family: "Mononoki Nerd Font"
                            font.pixelSize: 80
                        }

                        Text {
                            id: dateText

                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignCenter
                            color: "#a9b1d6"
                            font.bold: true
                            font.family: "Mononoki Nerd Font"
                            font.pixelSize: 30
                        }

                    }

                    Rectangle {
                        height: 300
                    }

                    Column {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 10

                        TextField {
                            id: user_entry

                            width: 300
                            height: 60
                            color: "#a9b1d6"
                            font.pixelSize: 20
                            font.bold: true
                            KeyNavigation.backtab: layoutBox
                            horizontalAlignment: Text.AlignHCenter
                            KeyNavigation.tab: pw_entry
                            text: userModel.lastUser
                            font.family: "Mononoki Nerd Font"

                            background: Rectangle {
                                radius: 30
                                color: "#444b6a"
                            }

                        }

                        TextField {
                            id: pw_entry

                            width: 300
                            height: 60
                            color: "#a9b1d6"
                            font.pixelSize: 20
                            font.bold: true
                            KeyNavigation.backtab: user_entry
                            KeyNavigation.tab: login_button
                            horizontalAlignment: Text.AlignHCenter
                            passwordCharacter: "•"
                            echoMode: TextInput.Password
                            font.family: "Mononoki Nerd Font"
                            Keys.onPressed: {
                                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                    sddm.login(user_entry.text, pw_entry.text, sessionIndex);
                                    event.accepted = true;
                                }
                            }

                            background: Rectangle {
                                radius: 30
                                color: "#444b6a"
                            }

                        }

                        Button {
                            id: login_button

                            width: 300
                            height: 60
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: sddm.login(user_entry.text, pw_entry.text, sessionIndex)
                            KeyNavigation.backtab: pw_entry
                            KeyNavigation.tab: session
                            hoverEnabled: true
                            states: [
                                State {
                                    name: "pressed"
                                    when: login_button.down

                                    PropertyChanges {
                                        target: buttonBackground
                                        color: "#acb0d0"
                                        opacity: 1
                                    }

                                    PropertyChanges {
                                        target: login_button.contentItem
                                    }

                                },
                                State {
                                    name: "hovered"
                                    when: login_button.hovered

                                    PropertyChanges {
                                        target: buttonBackground
                                        color: "#787c99"
                                        opacity: 1
                                    }

                                    PropertyChanges {
                                        target: login_button.contentItem
                                        opacity: 1
                                    }

                                },
                                State {
                                    name: "focused"
                                    when: login_button.activeFocus

                                    PropertyChanges {
                                        target: buttonBackground
                                        color: "#787c99"
                                        opacity: 1
                                    }

                                    PropertyChanges {
                                        target: login_button.contentItem
                                        opacity: 1
                                    }

                                },
                                State {
                                    name: "enabled"
                                    when: login_button.enabled

                                    PropertyChanges {
                                        target: buttonBackground
                                        color: "#444b6a"
                                        opacity: 1
                                    }

                                    PropertyChanges {
                                        target: login_button.contentItem
                                        opacity: 1
                                    }

                                }
                            ]

                            contentItem: Text {
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "LOGIN"
                                font.pixelSize: 20
                                font.bold: true
                                font.family: "Mononoki Nerd Font"
                                color: "#a9b1d6"
                            }

                            background: Rectangle {
                                id: buttonBackground

                                color: "#444b6a"
                                radius: 30
                            }

                        }

                    }

                    Timer {
                        id: time

                        interval: 100
                        running: true
                        repeat: true
                        onTriggered: {
                            dateText.text = Qt.formatDateTime(new Date(), "dd/MM/yyyy");
                            timeText.text = Qt.formatDateTime(new Date(), "HH:mm");
                        }
                    }

                }

            }

        }

    }

}
