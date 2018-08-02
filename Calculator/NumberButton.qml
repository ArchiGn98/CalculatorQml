import QtQuick 2.0
import QtQuick.Controls 2.2

Button{
    id:button
    font.pixelSize: 20
    property color onHoverColor: "black"
    property color borderColor: "#C0C0C0"
    property color buttonColor: "#C0C0C0"

    background: Rectangle{
        id:rec

        color: button.pressed ? Qt.darker(button.buttonColor, 1.5) : buttonColor

    }
}
