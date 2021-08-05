import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Dialogs 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Item {
    id: explorePage
    Rectangle {
        id: explorePageContainer
        color: "#1e1e1e"
        anchors.fill: parent

        RowLayout {
            id: row
            height: 40
            spacing: 10
            Layout.fillWidth: true
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 25
            Layout.preferredWidth: 500
            Layout.maximumWidth: 1000
            Layout.minimumWidth: 100

            Rectangle {
                id: searchBarContainer
                color: "#3c3c3c"
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 300
                Layout.maximumWidth: 1000
                Layout.minimumWidth: 100

                TextField {
                    id: textSearchBar
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    hoverEnabled: true
                    font.weight: Font.Thin
                    font.family: "Tahoma"
                    anchors.leftMargin: 10
                    anchors.rightMargin: 40
                    placeholderText: qsTr("Search...")
                    color: "white"
                    maximumLength: 200

                    background: Rectangle {
                        id: backgroundSearchBar
                        color: "#00000000"
                    }
                }

                TitleBarButton {
                    id: btnSearchBar
                    width: 36
                    height: 36
                    text: ""
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 2
                    colorPressed: "#007acc"
                    imagePath: "../../assets/svg/search.svg"
                    display: AbstractButton.IconOnly
                }

                QtObject {
                    id: internalSearchBarContainer
                    property int temp: btnSearchBar.hovered | textSearchBar.hovered
                    property var borderColor: temp ? "#007ACC" : "#000000"
                    property var borderWidth: temp ? 2 : 0
                }

                border.width: internalSearchBarContainer.borderWidth
                border.color: internalSearchBarContainer.borderColor

            }

//            Button {
//                id: dialogColorBG
//                Layout.maximumWidth: 40
//                Layout.minimumWidth: 40
//                Layout.fillWidth: true
//                Layout.fillHeight: true
//                onClicked: colorDialogBG.open()
//                background: Rectangle{
//                    height: 40
//                    width: 40
//                    border.color: "black"
//                    border.width: 2
//                    color: "#262626"
//                }
//            }

//            Button {
//                id: dialogColorFG
//                Layout.maximumWidth: 40
//                Layout.minimumWidth: 40
//                Layout.fillHeight: true
//                Layout.fillWidth: true
//                onClicked: colorDialogFG.open()
//                background: Rectangle{
//                    height: 40
//                    width: 40
//                    border.color: "black"
//                    border.width: 2
//                    color: "white"
//                }
//            }

            ComboBox {
                id: comboBoxPreviewTextType
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.maximumWidth: 100
                Layout.minimumWidth: 100
                wheelEnabled: true
                enabled: true
                font.weight: Font.Thin
                font.family: "Tahoma"
                anchors.rightMargin: 0
                currentIndex: 1
                model: ["Custom", "Alphabets", "Lorem Ipsum", "Printables"]

                indicator: Image {
                    id: comboBoxPreviewTextTypeExpandIcon
                    source: "../../assets/svg/combobox_expand.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.rightMargin: 2
                    width: 24
                    height: 24
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    antialiasing: true
                }

                delegate: ItemDelegate {
                    width: comboBoxPreviewTextType.width
                    background: Rectangle {
                        color: highlighted ? "#007acc" : "#3c3c3c"
                    }

                    contentItem: Text {
                        text: modelData
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                    }

                    highlighted: comboBoxPreviewTextType.highlightedIndex === index
                }

                contentItem: Text {
                    visible: true
                    color: "white"
                    width: comboBoxPreviewTextType.width - 10
                    text: comboBoxPreviewTextType.displayText
                    anchors.left: parent.left
                    font: comboBoxPreviewTextType.font
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 10
                    horizontalAlignment: Text.AlignLeft


                }

                QtObject {
                    id: internalComboBoxPreviewTextType
                    property var borderColor: comboBoxPreviewTextType.hovered ? "#007ACC" : "#000000"
                    property var borderWidth: comboBoxPreviewTextType.hovered ? 2 : 0
                }

                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 40
                    color: "#3c3c3c"
                    border.width: internalComboBoxPreviewTextType.borderWidth
                    border.color: internalComboBoxPreviewTextType.borderColor
                }
            }

            Rectangle {
                id: customSentenceContainer
                color: "#3c3c3c"
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 300
                Layout.maximumWidth: 1000
                Layout.minimumWidth: 100

                TextField {
                    id: textCustomSentence
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    hoverEnabled: true
                    font.weight: Font.Thin
                    font.family: "Tahoma"
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    placeholderText: qsTr("Type something here...")
                    color: "white"
                    maximumLength: 200

                    background: Rectangle {
                        id: backgroundCustomSentence
                        color: "#00000000"
                    }
                }

                QtObject {
                    id: internalCustomSentenceContainer
                    property var borderColor: textCustomSentence.hovered ? "#007ACC" : "#000000"
                    property var borderWidth: textCustomSentence.hovered ? 2 : 0
                }

                border.width: internalCustomSentenceContainer.borderWidth
                border.color: internalCustomSentenceContainer.borderColor



//                TitleBarButton {
//                    id: btnSearchBar
//                    width: 40
//                    height: 40
//                    text: ""
//                    anchors.right: parent.right
//                    colorPressed: "#007acc"
//                    imagePath: "../../assets/svg/search.svg"
//                    display: AbstractButton.IconOnly
//                    anchors.rightMargin: 0
//                }

            }



            ComboBox {
                id: comboBoxTextAlignment
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.maximumWidth: 40
                Layout.minimumWidth: 40
                wheelEnabled: true
                enabled: true
                font.weight: Font.Thin
                font.family: "Tahoma"
                anchors.rightMargin: 0
                currentIndex: 1
                model: ["1", "2", "3"]
                indicator: Item {

                }

                delegate: ItemDelegate {
                    width: comboBoxTextAlignment.width
                    background: Rectangle {
                        color: highlighted ? "#007acc" : "#3c3c3c"
                    }

                    contentItem: Text {
                        text: modelData
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                    }

                    highlighted: comboBoxTextAlignment.highlightedIndex === index
                }

                contentItem: Text {
                    visible: true
                    color: "white"
                    text: comboBoxTextAlignment.displayText
                    font: comboBoxTextAlignment.font
                    verticalAlignment: Text.AlignVCenter
                    clip: false
                    horizontalAlignment: Text.AlignHCenter

                }

                QtObject {
                    id: internal
                    property var borderColor: comboBoxTextAlignment.hovered ? "#007ACC" : "#000000"
                    property var borderWidth: comboBoxTextAlignment.hovered ? 2 : 0
                }

                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 40
                    color: "#3c3c3c"
                    border.width: internal.borderWidth
                    border.color: internal.borderColor
                }
            }

//            Button {
//                id: btnCardListView
//                Layout.maximumWidth: 40
//                Layout.minimumWidth: 40
//                Layout.fillHeight: true
//                Layout.fillWidth: true
//                text: "C/L"
//                background: Rectangle{
//                    height: 40
//                    width: 40
//                    border.color: "black"
//                    border.width: 2
//                    color: "white"
//                }
//            }

        }

    }

    ColorDialog {
        id: colorDialogFG
        modality: Qt.ApplicationModal
        onAccepted:
            dialogColorFG.background.color = this.color
    }

    ColorDialog {
        id: colorDialogBG
        modality: Qt.ApplicationModal
        onAccepted:
            dialogColorBG.background.color = this.color
    }

}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:680;width:1000}
}
##^##*/
