#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "TodoModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Set a non-native style for QtQuick Controls 2
    QQuickStyle::setStyle("Fusion");  // or "Material" or "Basic"

    // Create the TodoModel and add some example data
    TodoModel todoModel;
    todoModel.addTodoItem("Buy groceries", "Milk, eggs, bread", QColor("lightblue"), false);
    todoModel.addTodoItem("Buy milk", "From the store", QColor("blue"), false);
    todoModel.addTodoItem("Work out", "Go for a run", QColor("lightgreen"), false);
    todoModel.addTodoItem("Read a book", "The Catcher in the Rye", QColor("lightyellow"), false);


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("todoModel", &todoModel);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
