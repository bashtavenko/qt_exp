import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Minimal QML Test"

    Button {
        text: "Click Me"
        anchors.centerIn: parent
        onClicked: console.log("Button clicked")
    }
}
