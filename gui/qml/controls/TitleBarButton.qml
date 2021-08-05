import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnTitleBar
    text: qsTr("lalalala")
    implicitWidth: 35
    implicitHeight: 35

    property color colorDefault: "#3c3c3c"
    property color colorMouseOver: "#474748"
    property color colorPressed: "#474748"
    property url imagePath: "../../assets/svg/minimize_icon.svg"

    QtObject {
        id: internal

        property var dynamicColor: if (btnTitleBar.down) {
                                       btnTitleBar.down ? colorPressed : colorDefault
                                   } else {
                                       btnTitleBar.hovered ? colorMouseOver : colorDefault
                                   }
    }

    background: Rectangle{
        color: internal.dynamicColor

        Image {
            id: iconExploreBtn
            source: imagePath
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay {
            anchors.fill: iconExploreBtn
            source: iconExploreBtn
            color: "white"
            antialiasing: false
        }
    }
//    contentItem: Item {
//        Text {
//            id: labelBtn
//            text: btnTitleBar.text
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter
//        }
//    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1;height:40;width:200}
}
##^##*/
