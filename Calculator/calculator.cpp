#include "calculator.h"

Calculator::Calculator(QObject *parent) : QObject(parent), m_myModel(new JournalModel())
{
}

Calculator::~Calculator()
{
    delete m_myModel;
}

void Calculator::addNumber(QString numb)
{
    numbers.push_back(numb.toFloat());
}

void Calculator::addAction(QString act)
{
    actions.push_back(act);
}

void Calculator::deleteNumbers()
{
    numbers.clear();
}

void Calculator::deleteActions()
{
    actions.clear();
}

QString Calculator::getAnswer()
{
    sortVectors();
    for(QString s:actions){
        qDebug()<<s;
    }

    for(float f:numbers){
        qDebug()<<f;
    }
    float first;
    float second;
    float temp = numbers[0];
    int sw;
    qDebug()<<"numbers:";
    for(float n:numbers) qDebug()<<n;
    qDebug()<<"actions:";
    for(QString s:actions) qDebug()<<s;
    QString sign,answer = "";
    for(int i=1; i<numbers.size();++i){
        first = temp;
        second = numbers[i];
        sign = actions[i-1];

            if(sign.toStdString()=="+") sw=1;
            if(sign.toStdString()=="-") sw=2;
            if(sign.toStdString()=="*") sw=3;
            if(sign.toStdString()=="/") sw=4;
            switch (sw) {
            case 1:
                temp = sum(first,second);
                break;
            case 2:
                temp = minus(first,second);
                break;
            case 3:
                temp = multiply(first,second);
                break;
            case 4:
                temp = division(first,second);
                break;
            default:
                break;
            }
            qDebug()<<"Temp="<<temp<<"; first="<<first<<" ;second="<<second;


    }
    answer += QString::number(temp);
    qDebug()<<answer;
    return answer;



}

float Calculator::sum(float a, float b)
{
    return a+b;
}

float Calculator::multiply(float a, float b)
{
    return a*b;
}

float Calculator::division(float a, float b)
{
    return a/b;
}

float Calculator::minus(float a, float b)
{
    return a-b;
}

void Calculator::sortVectors()//do not ask me how it works
{
    QString tempString;
    float tempNumb1,tempNumb2;
    int minPlaceActions=0;
    for(int i=0;i<actions.size();++i){
        if(actions[i].toStdString()=="*" || actions[i].toStdString()=="/"){
            //qDebug()<<"1";
            tempString = actions[i];
            tempNumb1 = numbers[i];
            tempNumb2 = numbers[i+1];
            qDebug()<<tempNumb1<<" and "<<tempNumb2<<" i="<<i;
            //qDebug()<<"2";
            actions.erase(actions.begin()+i);
            actions.insert(actions.begin()+minPlaceActions,tempString);
            //qDebug()<<"3";
            numbers.erase(numbers.begin()+i);
            int k = i+1;
            numbers.erase(numbers.begin()+i);
            //qDebug()<<"4";
            numbers.insert(numbers.begin()+minPlaceActions,tempNumb1);
            numbers.insert(numbers.begin()+minPlaceActions+1,tempNumb2);
            //qDebug()<<"5";
            ++minPlaceActions;
        }
    }
}

void Calculator::del()
{
    qDebug()<<"Deleted";
}

void Calculator::item1FinishEvent()
{
    emit signalEvent1();
}

void Calculator::item2FinishEvent()
{
    emit signalEvent2();
}

void Calculator::item3FinishEvent()
{
    emit signalEvent3();
}


