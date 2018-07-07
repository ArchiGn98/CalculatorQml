#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QDebug>
#include <QString>
#include <vector>

class Calculator : public QObject
{
    Q_OBJECT
public:
    explicit Calculator(QObject *parent = nullptr);

    Q_INVOKABLE void addNumber(QString numb);
    Q_INVOKABLE void addAction(QString act);
    Q_INVOKABLE void deleteNumbers();
    Q_INVOKABLE void deleteActions();
    Q_INVOKABLE QString getAnswer();
    Q_INVOKABLE void del();
private:
    std::vector<float> numbers;
    std::vector<QString> actions;
    float sum(float a,float b);
    float multiply(float a,float b);
    float division(float a,float b);
    float minus(float a,float b);
    void sortVectors();

signals:

public slots:
};

#endif // CALCULATOR_H
