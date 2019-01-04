import QtQuick 2.8
import QtQuick.Controls 2.2
import Material 0.2
import Material.ListItems 0.1 as ListItem
import "../controllers/Constants.js" as Constants

Item {
    id: root
    width: 1200
    height: 800
    z: 200

    focus: screen.state !== "running"

    Keys.onReturnPressed: startBtn.click()

    property alias startButton: startBtn
    property alias finishButton: finishBtn

    Rectangle {
        anchors.centerIn: parent
        width: 800
        height: width
        color: "#444444"
        radius: width * 0.5
    }

    Label {
        anchors {
            top: parent.top
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        text: "比大小"
        color: "white"
        style: "display1"
    }

    Label {
        id: operationInfo
        anchors {
            top: parent.top
            topMargin: 150
            horizontalCenter: parent.horizontalCenter
        }
        text: "1. 观察数字" // 2. 选中最大的数字 // 3.完成
        color: "white"
        style: "headline"
    }

    EndEffect {
        id: end
        bColor: "#03A9F4"

        x: 400
        y: 200

        state: y === 370 ? "chooseState" : "moveState"

        //        x: 300
        //        y: 370
    }

    Rectangle {
        width: 100
        height: width
        radius: width * 0.5

        x: 280
        y: 350

        color: "#555555"

        Label {
            anchors.centerIn: parent
            text: "12"
            color: "white"
            style: "display2"
        }
    }

    ChooseResult {
        id: chooseResult
        size: 40
        x: 340
        y: 410
        visible: false
    }

    Rectangle {
        width: 100
        height: width
        radius: width * 0.5

        x: 480
        y: 350

        color: "#555555"

        Label {
            anchors.centerIn: parent
            text: "10"
            color: "white"
            style: "display2"
        }
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite
        NumberAnimation {
            // 暂停作用
            duration: 1000
        }
        PropertyAnimation {
            target: operationInfo
            property: "text"
            to: "2. 选择最大的数字"
        }
        ParallelAnimation {
            NumberAnimation {
                target: end
                property: "x"
                duration: 1000
                to: 300
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: end
                property: "y"
                duration: 1000
                to: 370
                easing.type: Easing.InOutQuad
            }
        }
        NumberAnimation {
            // 暂停作用
            duration: 2000
        }
        PropertyAnimation {
            target: chooseResult
            property: "visible"
            to: "true"
        }
        PropertyAnimation {
            target: operationInfo
            property: "text"
            to: "3. 完成"
        }
        PropertyAnimation {
            target: end
            property: "visible"
            to: "false"
        }
        NumberAnimation {
            // 暂停作用
            duration: 2000
        }
        ParallelAnimation {
            PropertyAnimation {
                target: chooseResult
                property: "visible"
                to: "false"
            }
            PropertyAnimation {
                target: operationInfo
                property: "text"
                to: "1. 观察数字"
            }
            NumberAnimation {
                target: end
                property: "x"
                to: 400
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: end
                property: "y"
                to: 200
                easing.type: Easing.InOutQuad
            }
        }
        PropertyAnimation {
            target: end
            property: "visible"
            to: "true"
        }
    }

    Item {
        width: parent.width * 0.4
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.15
        GameButton {
            id: startBtn
            text: "开始游戏"
            anchors {
                top: parent.top
                topMargin: 260
                horizontalCenter: parent.horizontalCenter
            }
            onClick: {
                if (screen.state === "pause")
                    screen.continued()
                else
                    screen.started()
            }
        }

        GameButton {
            id: finishBtn
            text: "结束游戏"
            enabled: screen.state === "pause"
            anchors {
                bottom: parent.bottom
                bottomMargin: 260
                horizontalCenter: parent.horizontalCenter
            }
            onClick: screen.finished()
        }
    }
}
