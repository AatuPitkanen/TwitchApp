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
                // All books in the store object
                query: "$.featured[*]"
            }

        SplitView {
            anchors.fill: parent

        ListView {
            id: lista
            width: 250
            height: 300
            contentHeight: 379
            spacing: 30
            flickableDirection: Flickable.AutoFlickDirection
            contentWidth: 0
            model: jsonModel1.model

                delegate: Rectangle {
                    Text {
                        text: model.stream.channel.name
                    }
                }
        }
        Image {
            sourceSize.width: -1
            fillMode: Image.PreserveAspectFit
            source: "http://static-cdn.jtvnw.net/jtv_user_pictures/nightblue3-profile_image-be8a5ea2b11d7f12-300x300.png"
        }
        }
    }
}


