import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnCustom
    text: qsTr("lalalala")
    implicitWidth: 200
    implicitHeight: 40

    property color colorDefault: "#252525"
    property color colorMouseOver: "#2A2D2E"
    property color colorPressed: "#007ACC"
    property bool isActiveMenu: true
    property url imageSource: "../../assets/svg/explore.svg"

    QtObject {
        id: internal

        property var dynamicColor: if (btnCustom.down) {
                                       btnCustom.down ? colorPressed : colorDefault
                                   } else {
                                       btnCustom.hovered ? colorMouseOver : colorDefault
                                   }
    }

    background: Rectangle{
        color: internal.dynamicColor

        Rectangle {
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: "#007ACC"
            width: 2
            visible: isActiveMenu
        }

        Image {
            id: iconExploreBtn
            source: imageSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 40
            width: 40
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay {
            anchors.fill: iconExploreBtn
            source: iconExploreBtn
            antialiasing: false
            color: "white"
        }
    }
//    contentItem: Item {
//        Text {
//            id: labelBtn
//            text: btnCustom.text
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter
//        }
//    }
}

/*##^##
Designer {
    D{i:0;height:65;width:65}
}
##^##*/
