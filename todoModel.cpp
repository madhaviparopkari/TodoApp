#include "TodoModel.h"
#include <QColor>

TodoModel::TodoModel(QObject *parent) : QAbstractListModel(parent)  // Constructor definition
{
}

void TodoModel::addTodoItem(const QString &title, const QString &description, const QColor &color, bool invertTextColor)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    qDebug() << "Adding todo item: Title=" << title << ", Description=" << description << ", Color=" << color;
    m_items.append(TodoItem(title, description, color, invertTextColor));
    endInsertRows();
}

void TodoModel::removeTodoItem(int row)
{
    if (row < 0 || row >= m_items.count()) return;

    beginRemoveRows(QModelIndex(), row, row);
    m_items.removeAt(row);
    endRemoveRows();
}


int TodoModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_items.count();
}

QVariant TodoModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const TodoItem &item = m_items.at(index.row());

    switch (role) {
    case TitleRole:
        qDebug() << "Returning title:" << item.title();
        return item.title();
    case DescriptionRole:
        return item.description();
    case ColorRole:
        qDebug() << "Returning color:" << item.color();
        return QVariant::fromValue(item.color());
    case InvertColorRole:
        return item.invertTextColor();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> TodoModel::roleNames() const
{
    qDebug() << "roleNames called!";
    QHash<int, QByteArray> roles;
    roles[TitleRole] = "title";
    roles[DescriptionRole] = "description";
    roles[ColorRole] = "color";
    roles[InvertColorRole] = "invertTextColor";
    return roles;
}
