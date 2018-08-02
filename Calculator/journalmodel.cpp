#include "journalmodel.h"



JournalModel::JournalModel(QObject *parent) : QAbstractListModel(parent)
{
    //ad smth from cpp
}

QHash<int, QByteArray> JournalModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[IconRole] = "mIcon";
    roles[TextRole] = "mText";

    return roles;
}


int JournalModel::rowCount(const QModelIndex &parent) const
{
    return m_data.size();
}

QVariant JournalModel::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case TextRole:
        return m_data.at(index.row());
        break;
    case IconRole:

        break;
    default:
        break;
    }

    return QVariant();
}

QModelIndex JournalModel::index(int row, int column, const QModelIndex &parent) const
{
    return createIndex(row,column);
}

int JournalModel::columnCount(const QModelIndex &parent) const
{
    return 1;
}


void JournalModel::addElement(QString value)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(value);
    endInsertRows();
}

void JournalModel::deleteElement(int index)
{
    if(!hasIndex(index,0))
    {
        return;
    }
    beginRemoveRows(QModelIndex(),index, index);
    m_data.removeAt(index);
    endRemoveRows();
}


void JournalModel::moveElement(int from, int to)
{
    if(!hasIndex(from,0) || !hasIndex(to,0) || (from == to))
    {
        return;
    }
    QModelIndex parent;
    if(beginMoveRows(parent,from, from, parent,to))
    {
        m_data.move(from, to);
        endMoveRows();
    }
}

void JournalModel::deleteAllElements()
{
    for(int i =0; i<3; ++i){//i don't know why, just like in Imagine Dragons song
        if(!hasIndex(m_data.size()-1,0))
        {
            return;
        }
        beginRemoveRows(QModelIndex(),0, m_data.size()-1);
        endRemoveRows();
        for(int i =0; i< m_data.size();++i){
            m_data.removeAt(i);
        }
    }


}
