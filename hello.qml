import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 240
        height: 240
        anchors.centerIn: parent
        color: '#CCCCCC'

        Rectangle {
            width: 40
            height: 40
            anchors.centerIn: parent
            color: '#FFBB33'
        }
    }

    Rectangle {
        id: rect1
        x: 12; y: 100
        width: 76; height: 96
        color: "lightsteelblue"
    }
    Rectangle {
        id: rect2
        x: 112; y: 100
        width: 76; height: 96
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8
    }

    Text {
        text: "The quick brown fox"
        color: "#303030"
        font.family: "Ubuntu"
        font.pixelSize: 28
    }
}
