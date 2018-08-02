#ifndef JOURNALMODEL_H
#define JOURNALMODEL_H

#include <QObject>
#include <QAbstractListModel>

class JournalModel : public QAbstractListModel
{
    Q_OBJECT
public:

    enum Roles {
        TextRole = Qt::UserRole + 1,
        IconRole
    };

    JournalModel(QObject *parent = Q_NULLPTR);

    Q_INVOKABLE virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    virtual QModelIndex index(int row, int column,
                              const QModelIndex &parent) const;
    virtual int columnCount(const QModelIndex &parent) const;

    QHash<int, QByteArray> roleNames() const;

    void addElement(QString value);
    void deleteElement(int index);
    void moveElement(int from, int to);
    void deleteAllElements();

private:
    QList<QString> m_data;

};

#endif // JOURNALMODEL_H
