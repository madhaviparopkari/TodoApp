#ifndef TODOITEM_H
#define TODOITEM_H

#include <QString>
#include <QColor>

class TodoItem
{
public:
    TodoItem(const QString &title, const QString &description, const QColor &color, bool invertTextColor = false)
        : m_title(title), m_description(description), m_color(color), m_invertTextColor(invertTextColor) {}

    QString title() const { return m_title; }
    QString description() const { return m_description; }
    QColor color() const { return m_color; }
    bool invertTextColor() const { return m_invertTextColor; }

    void setInvertTextColor(bool invert) { m_invertTextColor = invert; }

private:
    QString m_title;
    QString m_description;
    QColor m_color;
    bool m_invertTextColor;
};

#endif // TODOITEM_H
