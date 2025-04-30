import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 6.5

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Todo Task App"

    property color selectedColor: "lightblue"  // Light blue using predefined color name

    ColorDialog {
        id: colorDialog
        title: "Select Todo Color"
        onAccepted: {
            if (colorDialog.color !== undefined) {
                selectedColor = colorDialog.selectedColor
                console.log("Selected color:", selectedColor)
            } else {
                console.warn("ColorDialog returned undefined")
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        // Input section wrapped in a bordered Rectangle
        Rectangle {
            width: parent.width
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            color: "#f9f9f9" // light background
            border.color: "#999999"
            border.width: 1
            radius: 6
            Layout.alignment: Qt.AlignHCenter

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                // Title and description
                RowLayout {
                    spacing: 10

                    TextField {
                        id: titleField
                        placeholderText: "Add title"
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: descField
                        placeholderText: "Add description"
                        Layout.fillWidth: true
                    }
                }

                // Color picker and Add button row
                RowLayout {
                   spacing: 10

                   Layout.alignment: Qt.AlignCenter

                    Rectangle {
                        width: 16
                        height: 16
                        color: colorDialog.selectedColor
                        border.color: "black"
                        radius: 5
                    }

                    Button {
                        text: "Choose Color"
                        onClicked: colorDialog.open()
                    }

                    CheckBox {
                        id: invertColorCheckBox
                        text: "Invert Text Color"
                        checked: false
                    }

                    Button {
                        text: "Add Task"
                        width: 80
                        height: 30
                        font.pixelSize: 15

                        onClicked: {
                            if (titleField.text.length > 0 && descField.text.length > 0) {
                                todoModel.addTodoItem(titleField.text, descField.text, colorDialog.selectedColor, invertColorCheckBox.checked)
                                titleField.text = ""
                                descField.text = ""
                                invertColorCheckBox.checked = false
                                selectedColor = "lightblue"
                            } else {
                                console.log("Both title and description are required")
                            }
                        }
                    }
                }
            }
        }

        // Todo list
        ScrollView {
            Layout.fillWidth: true
            Layout.preferredHeight: 300
            clip: true

            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: todoModel
                delegate: Rectangle {
                    width: parent.width
                    height: 80
                    color: model.color
                    border.color: "black"
                    radius: 5
                    anchors.margins: 5

                    Column {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 4

                        Text {
                            text: model.title
                            font.bold: true
                            color: model.invertTextColor ? "white" : "black"
                        }

                        Text {
                            text: model.description
                            color: model.invertTextColor ? "white" : "black"
                        }
                    }

                    Button {
                        text: "Remove"
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.margins: +25
                        onClicked: todoModel.removeTodoItem(index)
                    }
                }
            }
        }
    }

}

