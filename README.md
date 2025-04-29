## QML Todo App
A simple Todo application built with Qt 6.5 using QML, showcasing a custom color picker, dynamic list handling, and UI features like color-coded items and text color inversion.

# Features
Add todo items with:

1. Title & description

2. Custom background color (from a dialog)

3. Option to invert text color (for readability)

4. Remove todo items

5. Scrollable and responsive layout

6. Custom color picker dialog

# Technologies Used
Qt 6.5

QML (Qt Quick 2.15)

C++ (for backend TodoModel)

QtQuick.Controls 2.15

QtQuick.Layouts 1.15

# Project Structure
 
             qml-todo-app/ 
                ├── main.cpp # Application entry point
                ├── TodoModel.h/.cpp # C++ model
                ├── TodoItem.h/.cpp # Item structure
                ├── qml/
                    └── main.qml # UI in QML
                ├── qml.qrc # Resource file for QML
                └── README.md 

# How to Run
1 .Install Qt 6.5 and ensure QtQuick and QtQuick.Controls modules are available.

2. Clone the repository:

   git clone https://github.com/madhaviparopkari/TodoApp.git

 
3.  Build and Run

    Open the .pro or CMakeLists.txt file.

    Select a Qt 6.5+ Kit.

    Run qmake first and then run. 
   
# Screenshots
Adding task form 

![image](https://github.com/user-attachments/assets/d53db14a-0b9c-4d19-9cf0-8d013b5cd229)



Choosing background color dialog for task 

![image](https://github.com/user-attachments/assets/32cee891-6235-4c65-8b5f-d1395699d2ba)



