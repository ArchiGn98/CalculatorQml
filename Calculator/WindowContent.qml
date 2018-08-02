import QtQuick 2.0
import QtQml.StateMachine 1.0 as FSM
Loader{
    id: loader
    anchors.fill: parent
    source: "Calculator.qml"


    FSM.StateMachine{
        id:machine
        running: true
        initialState: stateItem1
        FSM.State{
            id: stateItem1

            onEntered: {}
            onExited: {}



            FSM.SignalTransition{
                targetState: stateItem2
                signal: calc.signalEvent1
            }
        }
        FSM.State{
            id:stateItem2



            FSM.SignalTransition{
                targetState: stateItem1
                signal: calc.signalEvent2
            }
        }
    }

    states: [
        State {
            name: "State1"
            when: stateItem1.active == true
            PropertyChanges {
                target: loader
                source: "Calculator.qml"

            }
        },
        State {
            name: "State2"
            when: stateItem2.active == true
            PropertyChanges {
                target: loader
                source: "AboutThemes.qml"

            }
        }
    ]

    transitions: Transition{
        SequentialAnimation{
            NumberAnimation{
                target: loader.item
                property: "opacity"
                to: 0
                duration: 500
            }

            PropertyAction {
                target: loader;
                property: "source"
                //value: 100
            }

            NumberAnimation{
                target: loader.item
                property: "opacity"
                duration: 500
               // from: 0
                to: 1
            }
        }
    }
}
