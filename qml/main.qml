import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Todo Task App"

    property color selectedColor: "lightblue"  // Light blue using predefined color name



    /*ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        // Input form
        RowLayout {
            spacing: 10

            TextField {
                id: titleField
                placeholderText: "Title"
                Layout.fillWidth: true
            }

            TextField {
                id: descField
                placeholderText: "Description"
                Layout.fillWidth: true
            }

        }

        RowLayout{
            spacing: 10

            Rectangle {
                width: 30
                height: 30
                color: selectedColor
                border.color: "black"
                radius: 5
            }

            Button {
                text: "Choose Color"
                onClicked: colorPickerDialog.open()
            }

            CheckBox {
                id: invertColorCheckBox
                text: "Invert Text Color"
                checked: false
            }

            Button {
                text: "Add"
                onClicked: {
                    if (titleField.text.length > 0 && descField.text.length > 0) {
                        todoModel.addTodoItem(titleField.text, descField.text, selectedColor, invertColorCheckBox.checked)
                        titleField.text = ""
                        descField.text = ""
                        invertColorCheckBox.checked = false
                        selectedColor = "lightblue"  // Reset to light blue
                    } else {
                        console.log("Both title and description are required")
                    }
                }
            }
        }

        // Todo list
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: todoModel
            delegate: Rectangle {
                width: parent.width
                height: 80
                color: model.color // Bind color from the model
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
                    onClicked: todoModel.removeTodoItem(index)
                }
            }
        }
    }*/

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
                        color: selectedColor
                        border.color: "black"
                        radius: 5
                    }

                    Button {
                        text: "Choose Color"
                        onClicked: colorPickerDialog.open()
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
                                todoModel.addTodoItem(titleField.text, descField.text, selectedColor, invertColorCheckBox.checked)
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



    Dialog {
        id: colorPickerDialog
        title: "Select Todo Color"
        width: 300
        height: 400
        modal: true

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            ListView {
                id: colorList
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                model: ListModel {
                    ListElement { color: "lightblue" }
                    ListElement { color: "gray" }
                    ListElement { color: "blue" }
                    ListElement { color: "red" }
                    ListElement { color: "green" }
                    ListElement { color: "yellow" }
                    ListElement { color: "black" }
                    ListElement { color: "white" }
                }

                delegate: Rectangle {
                    width: colorList.width
                    height: 40
                    color: model.color
                    border.color: "black"
                    radius: 5

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Selected color: " + model.color)
                            selectedColor = model.color
                            colorPickerDialog.close()
                        }
                    }

                    Text {
                        text: model.color
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
            }

            Button {
                text: "Cancel"
                Layout.alignment: Qt.AlignRight
                onClicked: colorPickerDialog.close()
            }
        }
    }


}


/*import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 6.5

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Todo App"

    property color selectedColor: Qt.rgba(0.678, 0.847, 0.902, 1.0)  // Light blue

    ColorDialog {
        id: colorDialog
        title: "Select Todo Color"
        onAccepted: {
            if (colorDialog.color !== undefined) {
                selectedColor = colorDialog.color
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

        // Input form
        RowLayout {
            spacing: 10

            TextField {
                id: titleField
                placeholderText: "Title"
                Layout.fillWidth: true
            }

            TextField {
                id: descField
                placeholderText: "Description"
                Layout.fillWidth: true
            }

            Rectangle {
                width: 30
                height: 30
                color: selectedColor
                border.color: "black"
                radius: 5
            }

            Button {
                text: "Choose Color"
                onClicked: colorDialog.open()
            }

            Button {
                text: "Add"
                onClicked: {
                    if (titleField.text.length > 0 && descField.text.length > 0) {
                        todoModel.addTodoItem(titleField.text, descField.text, selectedColor, false)
                        titleField.text = ""
                        descField.text = ""
                        selectedColor = Qt.rgba(0.678, 0.847, 0.902, 1.0)
                    } else {
                        console.log("Both title and description are required")
                    }
                }
            }
        }

        // Todo list
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
                        text: title
                        font.bold: true
                        color: invertTextColor ? "white" : "black"
                    }

                    Text {
                        text: description
                        color: invertTextColor ? "white" : "black"
                    }
                }

                Button {
                    text: "Remove"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    onClicked: todoModel.removeTodoItem(index)
                }
            }
        }
    }


}*/

/*import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 6.5
import QtQuick.Layouts 1.15


ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Todo App"

    // Define the selected color property as light blue using RGBA
    property color selectedColor: Qt.rgba(0.678431, 0.847059, 0.901961, 1)

    Popup {
        id: customColorPicker
        width: 300
        height: 300
        modal: true

        Rectangle {
            anchors.fill: parent
            color: "white"
            border.color: "gray"
            border.width: 1
            radius: 6

            ColumnLayout {
                anchors.fill: parent
                spacing: 10

                ColorDialog {
                    id: internalColorDialog
                    onAccepted: {
                        selectedColor = internalColorDialog.color
                        customColorPicker.close()
                    }
                    onRejected: {
                        customColorPicker.close()
                    }
                }

                Button {
                    text: "Pick Color"
                    onClicked: internalColorDialog.open()
                }

                Button {
                    text: "Cancel"
                    onClicked: customColorPicker.close()
                }
            }
        }
    }


    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        // Input form for title and description
        RowLayout {
            spacing: 10

            TextField {
                id: titleField
                placeholderText: "Title"
                Layout.fillWidth: true
            }

            TextField {
                id: descField
                placeholderText: "Description"
                Layout.fillWidth: true
            }

            Rectangle {
                width: 30
                height: 30
                color: selectedColor  // This rectangle shows the selected color
                border.color: "black"
                radius: 5
            }

            Button {
                text: "Choose Color"
                onClicked: colorDialog.open()  // Open the color dialog when clicked
            }

            Button {
                text: "Add"
                onClicked: {
                    if (titleField.text.length > 0 && descField.text.length > 0) {
                        todoModel.addTodoItem(titleField.text, descField.text, selectedColor, false)
                        titleField.text = ""
                        descField.text = ""
                        selectedColor = "lightblue"  // Reset to light blue after adding
                    } else {
                        console.log("Both title and description are required")
                    }
                }
            }
        }

        // Todo list
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: todoModel
            delegate: Rectangle {
                width: parent.width
                height: 80
                color: color  // Use the color from the model here
                border.color: "black"
                radius: 5
                anchors.margins: 5

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 4

                    Text {
                        text: title
                        font.bold: true
                        color: invertTextColor ? "white" : "black"
                    }

                    Text {
                        text: description
                        color: invertTextColor ? "white" : "black"
                    }
                }

                Button {
                    text: "Remove"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    onClicked: todoModel.removeTodoItem(index)
                }
            }
        }
    }
}*/


/*import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 6.5
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Todo App"

    property color selectedColor: Qt.rgba(0.678431, 0.847059, 0.901961, 1)  // lightblue as rgba

    ColorDialog {
        id: colorDialog
        title: "Select Todo Color"
        onAccepted: {

            selectedColor = colorDialog.color
            text: "Color debug: " + selectedColor
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10

        // Input form
        RowLayout {
            spacing: 10

            TextField {
                id: titleField
                placeholderText: "Title"
                Layout.fillWidth: true
            }

            TextField {
                id: descField
                placeholderText: "Description"
                Layout.fillWidth: true
            }

            Rectangle {
                width: 30
                height: 30
                color: selectedColor
                border.color: "black"
                radius: 5
            }

            Button {
                text: "Choose Color"
                onClicked: colorDialog.open()
            }

            Button {
                text: "Add"
                onClicked: {
                    if (titleField.text.length > 0 && descField.text.length > 0) {
                        todoModel.addTodoItem(titleField.text, descField.text, selectedColor, false)
                        titleField.text = ""
                        descField.text = ""
                        selectedColor = "lightblue"
                    } else {
                        console.log("Both title and description are required")
                    }
                }
            }
        }

        // Todo list
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: todoModel
            delegate: Rectangle {
                width: parent.width
                height: 80
                color: selectedColor
                Text {
                    text: "Color debug: " + selectedColor
                    //color: "red"
                    anchors.top: parent.top
                    anchors.left: parent.left
                }

                border.color: "black"
                radius: 5
                anchors.margins: 5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: 10

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 4

                    Text {
                        text: title
                        font.bold: true
                        color: invertTextColor ? "white" : "black"
                    }

                    Text {
                        text: description
                        color: invertTextColor ? "white" : "black"
                    }
                }

                Button {
                    text: "Remove"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    onClicked: todoModel.removeTodoItem(index)
                }
            }
        }
    }
}*/
