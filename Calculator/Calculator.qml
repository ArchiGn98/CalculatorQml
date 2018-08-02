import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    visible: true
    width: 700
    height: 480
    id:window
    property string backImage: "qrc:/images/Theme1.jpg"
    property string numberBtColor: "#cc99ff" //85%
    property string actionBtColor: "#bf80ff" //80%
    property string out_inColor: "#f2e6ff" //90%



    Rectangle{
        id: menu
        height: 20
        width: parent.width
        anchors.top: parent.top
        color: window.numberBtColor

        NumberButton{
            height: parent.height
            id: optionsButton
            text: "About"
            onClicked: optionsMenu.open()
            anchors.left: themesButton.right
            buttonColor: window.numberBtColor
            Menu{
                id:optionsMenu
                y:optionsButton.height
                MenuItem{
                    text: "What you can do?"
                    onTriggered: {
                        calc.item1FinishEvent();
                    }
                }



            }
        }
        NumberButton{
            height: parent.height
            id: themesButton
            text: "Themes"
            onClicked: themesMenu.open()
            anchors.left: parent.left
            buttonColor: window.numberBtColor
            Menu{
                id:themesMenu
                y:themesButton.height

                MenuSeparator {
                    height: 2
                }

                    Menu {
                        title: "Choose Theme"

                        MenuItem {
                            height: themesButton.height
                            text: "Theme 1"
                            onTriggered: {
                                window.backImage = "qrc:/images/Theme1.jpg"
                                window.numberBtColor = "#cc99ff"
                                window.actionBtColor = "#bf80ff"
                                window.out_inColor = "#f2e6ff"
                            }
                        }
                        MenuItem {
                            height: themesButton.height
                            text: "Theme 2"
                            onTriggered: {
                                window.backImage = "qrc:/images/Theme2.jpg"
                                window.numberBtColor = "#80b3ff"
                                window.actionBtColor = "#66a3ff"
                                window.out_inColor = "#e6f0ff"
                            }
                        }
                        MenuItem {
                            height: themesButton.height
                            text: "Theme 3"
                            onTriggered: {
                                window.backImage = "qrc:/images/Theme3.jpg"
                                window.numberBtColor = "#6666ff"
                                window.actionBtColor = "#4d4dff"
                                window.out_inColor = "#e6e6ff"
                            }
                        }
                        MenuItem {
                            height: themesButton.height
                            text: "Theme 4"
                            onTriggered: {
                                window.backImage = "qrc:/images/Theme4.jpg"
                                window.numberBtColor = "#ffff66"
                                window.actionBtColor = "#cccc00"
                                window.out_inColor = "#ffff00"
                            }
                        }
                    }




            }
        }
    }
    Rectangle{
        id: root
        height: parent.height-20
        width: parent.width
        anchors.bottom: parent.bottom

        Rectangle{
            id:journal
            width: root.width/7*3
            height:root.height
            anchors.left: out_in.right
            border.width: 2
            border.color: "#696969"
            radius: 3
            BorderImage {
                id: backgroundJournal

                source: window.backImage
                anchors.fill:parent
                border { left: 20; top: 20; right: 20; bottom: 20 }
            }

            Rectangle{
                width: parent.width
                height: journalTxt.height+10
                anchors.top: journal.top
                anchors.horizontalCenter: journal.horizontalCenter
                color: window.actionBtColor
                Text{
                    id: journalTxt
                    text: "Journal:"
                    font.pixelSize: 30
                    anchors.centerIn: parent
                    anchors.margins: 10
                }
            }

            ListView{
                id: journalList
                width: parent.width - 20
                height: parent.height - journalTxt.height - rubish.height - 40
                anchors.centerIn: parent
                model: calc.myModel
                property int from: currentIndex
                onCurrentIndexChanged: from = currentIndex

                move: Transition { //parallel animations by default
                    NumberAnimation { properties: "x,y"; duration: 250}
                    NumberAnimation { properties: "scale"; to: 1.0; duration: 250}
                    NumberAnimation { properties: "opacity"; to: 1.0; duration: 250}
                }

                moveDisplaced: Transition {
                    NumberAnimation { properties: "x,y"; duration: 250}
                }

                add: Transition {
                    NumberAnimation { properties: "opacity"; from: 0.0; to: 1.0; duration: 500 }
                    SequentialAnimation {
                        NumberAnimation { properties: "scale"; from: 0.0; to: 2.0; duration: 250; easing.type: Easing.InOutQuad }
                        NumberAnimation { properties: "scale"; to: 1.0; duration: 250; easing.type: Easing.InOutQuad }
                    }
                }

                delegate: Rectangle{
                    id: itemDelegate
                    z:0

                    ListView.onRemove://delegate's custom animation, before it remove
                    SequentialAnimation {

                        PropertyAction { target: itemDelegate; property: "ListView.delayRemove"; value: true } // don't remove item on the spot

                        ParallelAnimation {
                            NumberAnimation { target: itemDelegate;  properties: "opacity"; from: 1.0; to: 0.0; duration: 500 }
                            SequentialAnimation {
                                NumberAnimation { target: itemDelegate;  properties: "scale"; from: 1.0; to: 2.0; duration: 250 }
                                NumberAnimation {  target: itemDelegate; properties: "scale"; to: 0.0; duration: 250 }
                            }
                        }

                        PropertyAction { target: itemDelegate; property: "ListView.delayRemove"; value: false } // ok, can remove it
                    }

                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: titleLabel.implicitHeight

                    gradient: Gradient {
                        GradientStop {
                            position: 0.00;
                            color: "#ffffff";
                        }
                        GradientStop {
                            position: 0.87;
                            color: window.numberBtColor;
                        }
                        GradientStop {
                            position: 1.00;
                            color: "#ffffff";
                        }
                    }

                    border.color: "grey"
                    Text{
                        id: titleLabel
                        text: mText
                        anchors.fill:parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment:  Text.AlignVCenter
                        font.pixelSize: 16
                        Component.onCompleted: {
                            console.log("loaded");
                        }
                    }
                }
            }
            Rectangle{
                height: 40
                width: 40
                color:window.actionBtColor
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 10
                radius: 6
                border.width: 1
                border.color: "black"
                Image{
                    id: rubish
                    source: "qrc:/images/rubishBox.png"
                    height: 30
                    width: 30
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            rubish.opacity = 0.7
                            calc.deleteAllElements()
                        }
                        onReleased: {
                            rubish.opacity = 1
                        }
                    }
                }
            }

        }
          Rectangle {
            id:out_in
            width: root.width/7*4
            height: root.height/4
            color: window.out_inColor
            Column {
                Rectangle {
                    id:input
                    width: out_in.width
                    height: out_in.height/3*2
                    color: window.out_inColor
                    Text {
                        id: txtIn
                        anchors.centerIn: input
                        font.pixelSize: 48
                        property string number: ""
                        property string action: ""
                    }
                }

                Rectangle {
                    id:output
                    width: out_in.width
                    height: out_in.height/3
                    color: window.out_inColor
                    Text {
                        id: txtOut
                        text: qsTr("")
                        color:"grey"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: output.bottom
                        anchors.rightMargin: 10
                        font.pixelSize: 32
                    }
                }
            }
          }
          Rectangle {
            id:controls
            width: root.width/7*4
            height: root.height/4*3
            anchors.top: out_in.bottom
            Column {
                Row {
                    NumberButton{
                        id:one
                        text: "1"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="1"
                            txtIn.number+="1"
                        }
                    }
                    NumberButton{
                        id:two
                        text: "2"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="2"
                            txtIn.number+="2"
                        }
                    }
                    NumberButton{
                        id:three
                        text: "3"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="3"
                            txtIn.number+="3"
                        }
                    }
                    ActionButton{
                        id:plus
                        text: "+"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.actionBtColor
                        onPressed: {
                            answer.opacity = 0;
                            if(txtOut.text != ""){
                                txtIn.number = ""
                                txtIn.number = txtOut.text.toString()
                                txtIn.text = txtOut.text.toString()
                                txtIn.text +="+"
                                txtIn.action = "+"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                                txtOut.text = ""
                            }
                            else{
                                txtOut.text = ""
                                txtIn.text +="+"
                                txtIn.action = "+"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                            }

                        }
                    }
                }
                Row {
                    NumberButton{
                        id:four
                        text: "4"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="4"
                            txtIn.number += "4"
                        }
                    }
                    NumberButton{
                        id:five
                        text: "5"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="5"
                            txtIn.number += "5"
                        }
                    }
                    NumberButton{
                        id:six
                        text: "6"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="6"
                            txtIn.number += "6"
                        }
                    }
                    ActionButton{
                        id:division
                        text: "/"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.actionBtColor
                        onPressed: {
                            answer.opacity = 0;
                            if(txtOut.text != ""){
                                txtIn.number = ""
                                txtIn.number = txtOut.text.toString()
                                txtIn.text = txtOut.text.toString()
                                txtIn.text +="/"
                                txtIn.action = "/"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                                txtOut.text = ""
                            }
                            else{
                                txtOut.text = ""
                                txtIn.text +="/"
                                txtIn.action = "/"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                            }
                        }
                    }
                }
                Row {
                    NumberButton{
                        id:seven
                        text: "7"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="7"
                            txtIn.number += "7"
                        }
                    }
                    NumberButton{
                        id:eight
                        text: "8"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            answer.opacity = 0;
                            txtOut.text = ""
                            txtIn.text +="8"
                            txtIn.number += "8"
                        }
                    }
                    NumberButton{
                        id:nine
                        text: "9"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            txtOut.text = ""
                            txtIn.text +="9"
                            txtIn.number += "9"
                        }
                    }
                    ActionButton{
                        id:muiltiply
                        text: "*"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.actionBtColor
                        onPressed: {
                            answer.opacity = 0;
                            if(txtOut.text != ""){
                                txtIn.number = ""
                                txtIn.number = txtOut.text.toString()
                                txtIn.text = txtOut.text.toString()
                                txtIn.text +="*"
                                txtIn.action = "*"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                                txtOut.text = ""
                            }
                            else{
                                txtOut.text = ""
                                txtIn.text +="*"
                                txtIn.action = "*"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                            }

                        }
                    }
                }
                Row {
                    NumberButton{
                        id:dot
                        text: "."
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            txtOut.text = ""
                            txtIn.text +="."
                            txtIn.number +="."
                        }
                    }
                    NumberButton{
                        id:ziro
                        text: "0"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.numberBtColor
                        onPressed: {
                            txtOut.text = ""
                            txtIn.text +="0"
                            txtIn.number +="0"
                        }
                    }
                    ActionButton{
                        id:equals
                        text: "="
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.actionBtColor
                        onPressed: {

                            txtOut.text = ""
                            calc.addNumber(txtIn.number.toString())
                            txtIn.number = ""
                            txtOut.text = calc.getAnswer();
                            calc.addElement(txtIn.text.toString()+ " = " +txtOut.text.toString())
                            calc.deleteNumbers();
                            calc.deleteActions();
                            answer.opacity = 1;

                        }

                    }
                    ActionButton{
                        id:minus
                        text: "-"
                        height: controls.height/5
                        width: controls.width/4
                        buttonColor: window.actionBtColor
                        onPressed: {
                            answer.opacity = 0;
                            if(txtOut.text != ""){
                                txtIn.number = ""
                                txtIn.number = txtOut.text.toString()
                                txtIn.text = txtOut.text.toString()
                                txtIn.text +="-"
                                txtIn.action = "-"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                                txtOut.text = ""
                            }
                            else{
                                txtOut.text = ""
                                txtIn.text +="-"
                                txtIn.action = "-"
                                calc.addNumber(txtIn.number.toString())
                                calc.addAction(txtIn.action.toString())
                                txtIn.number = ""
                                txtIn.action = ""
                            }

                        }
                    }
                }
                ActionButton {
                    id: del
                    text: "DELETE"
                    width: out_in.width
                    height: controls.height/5
                    buttonColor: window.actionBtColor
                    onPressAndHold: {

                    }
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text =""
                        txtIn.number = ""
                        txtIn.action = ""
                        calc.deleteNumbers()
                        calc.deleteActions()
                        calc.del()
                        answer.opacity = 0
                    }
                }
            }
          }
          Rectangle{
              id: answer
              width: out_in.width
              height: out_in.height/3*2
              anchors.top: out_in.top
              opacity: 0
              color: window.out_inColor
              Text {
                  id: txtAnswer
                  text: "Answer:"
                  anchors.centerIn: answer
                  font.pixelSize: 48
              }
          }

    }



}
