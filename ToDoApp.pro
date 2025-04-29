# Define the project type
QT += quick

# Define the source and header files
SOURCES += main.cpp \
           todoModel.cpp

HEADERS += todoModel.h\
           todoItem.h

# Define the resources
RESOURCES += qml.qrc


# Set the target output
TARGET = TodoApp

# Add the Qt Quick module
QT += qml quick gui quickcontrols2
CONFIG += c++17

