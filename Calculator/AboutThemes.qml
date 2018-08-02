import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle{
    id: about
    property string colorInside: "#ff944d"
    property string colorOutside: "ff751a"
    property string text: "In this application you can choose themes depending on your mood. Legends say that in one day there will be more!"
    property string buttonColor: "#cc5200"
    color: colorOutside
    height: parent.height
    width: parent.width
    Rectangle{
        height: parent.height -20
        width: parent.width - 20
        radius: 10
        color: parent.colorInside
        anchors.centerIn: parent
        Text{
            id:aboutTxt
            text: about.text
            font.pixelSize: 12
            anchors.margins: 10
            anchors.centerIn: parent
        }
        Button{
            id: back
            text: "BACK"
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            background: Rectangle{
                radius: 2
                color:about.buttonColor
            }
            onClicked: {
                calc.item2FinishEvent();
            }
        }
        Button{
            id: aboutThemes
            text: "About Themes"
            anchors.left: back.right
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            background: Rectangle{
                radius: 2
                color: button.pressed ? Qt.darker(about.buttonColor, 1.5) : buttonColor
            }
            onClicked: {
                aboutTxt.text = "In this application you can choose themes depending on your mood. Legends say that in one day there will be more!"
            }
        }
        Button{
            id: whatDo
            text: "What you can do?"
            anchors.left: aboutThemes.right
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            background: Rectangle{
                radius: 2
                color: button.pressed ? Qt.darker(about.buttonColor, 1.5) : buttonColor

            }
            onClicked: {
                aboutTxt.text = "What you can do? \n
    -Firstly, this app is a powerful calculator, which will become greater and greater. \n
    -Secondly, there are lot's of themes, in future I want to add user themes functionality. \n
    -Also, it's look good."
            }
        }
    }

}
