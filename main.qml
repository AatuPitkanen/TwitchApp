import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.3


Window {
    visible: true
    width: 500
    height: 700
    minimumWidth: lista.implicitWidth
    MouseArea {

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

        SplitView {
            id: splitView1
            width: 200
            height: 300
            anchors.fill: parent

        ListView {
            id: lista
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.top: parent.top
            anchors.topMargin: 1
            contentHeight: 379
            spacing: 50
            flickableDirection: Flickable.AutoFlickDirection
            contentWidth: 0
            model: jsonModel1.model

            delegate: Rectangle {
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 55
                        text: model.stream.channel.name
                    }
                    Text {
                        styleColor: "#06d6f0"
                        font.italic: true
                        font.pixelSize: 9
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 55
                        anchors.topMargin: 20
                        text: model.stream.viewers
                    }
                    Image {
                        width: 50
                        height: 50
                        source: model.stream.channel.logo
                        MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                   console.info("image clicked!")
                                }
                            }
                    }
            }
        }

        }
    }
}
