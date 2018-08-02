#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QDebug>
#include <QString>
#include <vector>
#include "journalmodel.h"

class Calculator : public QObject
{
    Q_OBJECT
    JournalModel* m_myModel;
    QStringList m_list;
    \
public:
    Q_PROPERTY(QStringList list READ list WRITE setList NOTIFY listChanged)
    Q_PROPERTY(JournalModel* myModel READ myModel WRITE setMyModel NOTIFY myModelChanged)

    explicit Calculator(QObject *parent = nullptr);
    ~Calculator();

    Q_INVOKABLE void addNumber(QString numb);
    Q_INVOKABLE void addAction(QString act);
    Q_INVOKABLE void deleteNumbers();
    Q_INVOKABLE void deleteActions();
    Q_INVOKABLE QString getAnswer();
    Q_INVOKABLE void del();


    Q_INVOKABLE void item1FinishEvent();
    Q_INVOKABLE void item2FinishEvent();
    Q_INVOKABLE void item3FinishEvent();



    Q_INVOKABLE void addElement(QString value) {
        m_myModel->addElement(value);
    }

    Q_INVOKABLE void moveElement(int from, int to)
    {
        m_myModel->moveElement(from, to);
    }

    Q_INVOKABLE void deleteElement(int index) {
        m_myModel->deleteElement(index);
    }
    Q_INVOKABLE void deleteAllElements(){
        m_myModel->deleteAllElements();
    }
    JournalModel* myModel() const{
        return m_myModel;
    }
    QStringList list() const{
        return m_list;
    }

private:
    std::vector<float> numbers;
    std::vector<QString> actions;

    float sum(float a,float b);
    float multiply(float a,float b);
    float division(float a,float b);
    float minus(float a,float b);
    void sortVectors();

signals:
    void myModelChanged(JournalModel* myModel);
    void listChanged(QStringList list);
    void signalEvent1();
    void signalEvent2();
    void signalEvent3();
public slots:
    void setMyModel(JournalModel* myModel)
    {
        if (m_myModel == myModel)
            return;

        m_myModel = myModel;
        emit myModelChanged(m_myModel);
    }
    void setList(QStringList list)
    {
        if (m_list == list)
            return;

        m_list = list;
        emit listChanged(m_list);
    }
};

#endif // CALCULATOR_H
