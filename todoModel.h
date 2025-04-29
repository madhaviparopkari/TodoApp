#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>
#include <QList>
#include "TodoItem.h"

class TodoModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TodoModel(QObject *parent = nullptr);  // Declaration only

    enum TodoRoles {
        TitleRole = Qt::UserRole + 1,
        DescriptionRole,
        ColorRole,
        InvertColorRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void addTodoItem(const QString &title, const QString &description, const QColor &color, bool invertTextColor = false);
    void removeTodoItem(int row);

private:
    QList<TodoItem> m_items;
};

#endif // TODOMODEL_H
