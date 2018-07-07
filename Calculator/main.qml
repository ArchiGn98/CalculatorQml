import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 400
    height: 480
    title: qsTr("Calc")
    id: root
      Rectangle {
        id:out_in
        width: root.width
        height: root.height/4
        color: "white"
        Column {
            Rectangle {
                id:input
                width: root.width
                height: out_in.height/3*2
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
                width: root.width
                height: out_in.height/3
                Text {
                    id: txtOut
                    text: qsTr("")
                    color:"grey"
                    anchors.right: output.right
                    anchors.bottom: output.bottom
                    anchors.rightMargin: 10
                    font.pixelSize: 32
                }
            }
        }
      }
      Rectangle {
        id:controls
        width: root.width
        height: root.height/4*3
        anchors.top: out_in.bottom
        color: "black"
        Column {
            Row {
                Button{
                    id:one
                    text: "1"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="1"
                        txtIn.number+="1"
                    }
                }
                Button{
                    id:two
                    text: "2"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="2"
                        txtIn.number+="2"
                    }
                }
                Button{
                    id:three
                    text: "3"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="3"
                        txtIn.number+="3"
                    }
                }
                Button{
                    id:plus
                    text: "+"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
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
            Row {
                Button{
                    id:four
                    text: "4"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="4"
                        txtIn.number += "4"
                    }
                }
                Button{
                    id:five
                    text: "5"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="5"
                        txtIn.number += "5"
                    }
                }
                Button{
                    id:six
                    text: "6"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="6"
                        txtIn.number += "6"
                    }
                }
                Button{
                    id:division
                    text: "/"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
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
            Row {
                Button{
                    id:seven
                    text: "7"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="7"
                        txtIn.number += "7"
                    }
                }
                Button{
                    id:eight
                    text: "8"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="8"
                        txtIn.number += "8"
                    }
                }
                Button{
                    id:nine
                    text: "9"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="9"
                        txtIn.number += "9"
                    }
                }
                Button{
                    id:muiltiply
                    text: "*"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
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
            Row {
                Button{
                    id:dot
                    text: "."
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="."
                        txtIn.number +="."
                    }
                }
                Button{
                    id:ziro
                    text: "0"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        txtIn.text +="0"
                        txtIn.number +="0"
                    }
                }
                Button{
                    id:equals
                    text: "="
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
                        txtOut.text = ""
                        calc.addNumber(txtIn.number.toString())
                        txtIn.number = ""
                        txtOut.text = calc.getAnswer();
                        calc.deleteNumbers();
                        calc.deleteActions();
                    }
                }
                Button{
                    id:minus
                    text: "-"
                    height: controls.height/5
                    width: controls.width/4
                    font.pixelSize: 20
                    onPressed: {
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
            Button {
                id: del
                text: "DELETE"
                width: out_in.width
                height: controls.height/5
                font.pixelSize: 20
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
                }
            }
        }
      }
}
