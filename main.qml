import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

Window {
    visible: true

    MouseArea {
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }

        ListView {
            id: listView1
            x: 15
            y: 82
            width: 110
            height: 160
            model: ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
            delegate: Item {
                x: 5
                width: 80
                height: 40
                Row {
                    id: row1
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                    }

                    Text {
                        text: name
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    spacing: 10
                }
            }
        }

        Button {
            id: button1
            x: 27
            y: 342
            text: qsTr("Joku")
        }

        Button {
            id: button2
            x: 8
            y: 17
            text: qsTr("Search")
        }

        TextEdit {
            id: textEdit1
            x: 99
            y: 21
            width: 80
            height: 20
            text: qsTr("Search")
            font.pixelSize: 12
        }
    }
}

