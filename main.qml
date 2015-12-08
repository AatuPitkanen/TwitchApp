import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.3


Window {
    visible: true
    width: 400
    height: 600

    color: "#c2cfcf"
    minimumWidth: 200
    minimumHeight: 325
    MouseArea {
        id: mouseArea1

        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }


        JSONListModel {
                id: jsonModel1
                source: "https://api.twitch.tv/kraken/streams/featured"
                query: "$.featured[*]"
            }

        ListView {
            id: lista
            width: 307
            clip: true
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 40
            contentHeight: 365
            contentWidth:  200
            spacing: 51
            flickableDirection: Flickable.AutoFlickDirection
            model: jsonModel1.model

            delegate: Rectangle {
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 55
                        text: model.stream.channel.status
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        styleColor: "#06d6f0"
                        font.italic: true
                        font.pixelSize: 11
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 55
                        anchors.topMargin: 15
                        text: model.stream.channel.name
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        styleColor: "#06d6f0"
                        font.italic: true
                        font.pixelSize: 9
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 55
                        anchors.topMargin: 30
                        text:"Viewers: " + model.stream.viewers
                    }
                    Image {
                        width: 50
                        height: 50
                        source: model.stream.channel.logo
                        MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                          app.playvideo()

                                }
                        }
                    }
            }
        }

        TextField {
            anchors.leftMargin: 1
            id: searchfield
            x: 40
            y: 9
            width: 120
            anchors.bottom: lista.top
            anchors.bottomMargin: 6
            placeholderText: qsTr("")
        }

        }
    }
