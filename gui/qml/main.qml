import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"
import "pages"

Window {
    id: mainWindow
    width: 1000
    height: 600
    visible: true
    color: "#00000000"
    title: qsTr("Phonts")
    minimumWidth: 1000
    minimumHeight: 600

    Component.onCompleted: {
        backend.setValue()
    }
    property string osType: "x"

    Rectangle {
        id: bg
        color: "#1e1e1e"
        border.color: "#00000000"
        anchors.fill: parent
        
        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            
            Rectangle {
                id: paneContainer
                color: "#00000000"
                anchors.fill: parent
                
                Rectangle {
                    id: leftPane
                    width: 65
                    color: "#252525"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    Rectangle {
                        id: leftPaneContainer
                        color: "#00000000"
                        border.color: "#00000000"
                        anchors.fill: parent
                        anchors.bottomMargin: statusBar.height

                        Column {
                            id: columnLeftPane
                            anchors.fill: parent
                            clip: true

                            CustomButton {
                                id: button
                                width: leftPane.width
                                height: leftPane.width
                                text: qsTr("Button")
                                checked: true
                                checkable: true
                                display: AbstractButton.IconOnly
                            }
                        }
                    }
                }

                Rectangle {
                    id: contentPane
                    color: "#00000000"
                    anchors.left: leftPane.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 25
                    anchors.leftMargin: 0

                    ExplorePage {
                        id: contentExplorePage
                        anchors.fill: parent
                    }
                }
            }
        }
        
        Rectangle {
            id: statusBar
            y: 338
            height: 25
            color: "#007acc"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Text {
                id: labelStatusBarInstalledFonts
                y: 8
                color: "#e8e7e7"
                text: qsTr("Installed Fonts - 56")
                elide: Text.ElideNone
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 10
                horizontalAlignment: Text.AlignLeft
                anchors.leftMargin: 10
                minimumPixelSize: 9
                minimumPointSize: 9
                font.family: "Tahoma"
                maximumLineCount: 1
            }

            Text {
                id: labelStatusBarVersion
                y: 8
                color: "#e8e7e7"
                text: qsTr("Version - 0.0.1a")
                elide: Text.ElideNone
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                font.pixelSize: 10
                horizontalAlignment: Text.AlignRight
                anchors.rightMargin: 10
                minimumPointSize: 9
                minimumPixelSize: 9
                font.family: "Tahoma"
                maximumLineCount: 1
            }
        }
        
    }

    Connections {
            target: backend
            function onOsType(argument) { mainWindow.osType = argument }
        }
}











/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
