import QtQuick 2.8
import QtQuick.Controls 2.2
import Material 0.2
import Material.ListItems 0.1 as ListItem

Rectangle {
    id: root
    property int graphBlockSize: 100
    property string graphColor: "#DDDDDD"
    property var gameData: Object
    property var targetPoints: gameData.target_point_list

    width: 1200
    height: 800
    color: "#666666"

    Repeater {
        anchors.fill: parent
        model: gameData.size
        delegate:  Rectangle {
            width: 120
            height: width
            radius: width * 0.5

            x: gameData.view_point_list[index][0]
            y: gameData.view_point_list[index][1]

            color: "#444444"

            Label {
                anchors.centerIn: parent
                text: gameData.number_list[index]
                color: "white"
                style: "display3"
            }
        }
    }
}
