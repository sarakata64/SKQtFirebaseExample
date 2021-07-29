#include "skqtrealtimedatabase.h"
#include <QNetworkRequest>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>
#include <QJsonObject>
#include <QJsonArray>
#include "skqtauth.h"
#include "SKQtFirebase_global.h"
#include <QPixmap>
SKQtRealTimeDatabase::SKQtRealTimeDatabase(QObject *parent): QObject(parent)
{
  _manager = new QNetworkAccessManager(this);

}

void SKQtRealTimeDatabase::readData(QString url)
{
    _reply = _manager->get(QNetworkRequest(QUrl(_dataUrl +"/" + url+".json?auth="+_idToken)));
    connect(_reply, &QNetworkReply::readyRead, this, &SKQtRealTimeDatabase::getData);
     dataAvaible();
}

void SKQtRealTimeDatabase::sendData(QString url, QVariantMap map)
{
  QJsonDocument myjson = QJsonDocument::fromVariant(map);
  QString temp;
  temp=_dataUrl +"/" + url+".json?auth="+_idToken;
  qDebug()<< "temp : "<<temp;

  QNetworkRequest myrequest((QUrl(temp)));
  myrequest.setHeader(QNetworkRequest::ContentTypeHeader,QString("applicaton/json"));
  _manager->post(myrequest,myjson.toJson());
}

void SKQtRealTimeDatabase::replaceData(QString url, QVariantMap map)
{
    QJsonDocument myjson = QJsonDocument::fromVariant(map);
    QString temp;
    temp=_dataUrl +"/" + url+".json?auth="+_idToken;
    qDebug()<< "temp : "<<temp;

    QNetworkRequest myrequest((QUrl(temp)));
    myrequest.setHeader(QNetworkRequest::ContentTypeHeader,QString("applicaton/json"));
    _manager->put(myrequest,myjson.toJson());
}

void SKQtRealTimeDatabase::setDataRootUrl(QString url)
{
    _dataUrl = url;
}

void SKQtRealTimeDatabase::deleteData(QString child)
{
     _reply = _manager->deleteResource(QNetworkRequest(QUrl(_dataUrl +"/" + child+".json?auth="+_idToken)));

}

void SKQtRealTimeDatabase::upDateData(QString child,QString key, QString value)
{
    QBuffer *buff = new QBuffer;
    buff->open(QIODevice::ReadWrite);
    buff->write(QString{ "{ \""+key+"\": \""+value+"\" }" }.toUtf8());
    buff->seek(0);

    QString temp;
    temp=_dataUrl +"/" + child+".json?auth="+_idToken;
    QNetworkRequest myrequest((QUrl(temp)));
   myrequest.setHeader(QNetworkRequest::ContentTypeHeader,QString("applicaton/json;charset=UTF-8"));
   _manager->sendCustomRequest(myrequest,"PATCH",buff);
}

void SKQtRealTimeDatabase::putImage(QString child, QString ImageUrl)
{
   /* QVariantMap payload;
    payload["Authorization"]="Bearer "+_idToken ;
    //payload["returnSecureToken"]= true;
    QJsonDocument doc = QJsonDocument::fromVariant(payload);

    QString url = "https://firebasestorage.googleapis.com/v0/b/fir-demo-d3d5f.appspot.com/o?uploadType=media&name=C:/Users/assou/Desktop/HD_1057.png";
  // QPixmap pix("C:/Users/assou/Desktop/HD_1057.png");

    // QJsonDocument myjson = QJsonDocument::fromVariant("C:/Users/assou/Desktop/HD_1057.png");

    QNetworkRequest myrequest((QUrl(url)));
    myrequest.setHeader(QNetworkRequest::ContentTypeHeader,QString("image/png"));
    _manager->post(myrequest,doc.toJson());*/
}

void SKQtRealTimeDatabase::addBucket()
{
   /* QString url = " https://firebasestorage.googleapis.com/v1beta/fir-demo-d3d5f.appspot.com:addFirebase";
    QVariantMap payload;
   // payload["idToken"]=_idToken ;
   // payload["returnSecureToken"]= true;
    QJsonDocument doc = QJsonDocument::fromVariant(payload);

    QNetworkRequest myrequest((QUrl(url)));
    myrequest.setHeader(QNetworkRequest::ContentTypeHeader,QString(""));
    _manager->post(myrequest,doc.toJson());*/
}

SKQtRealTimeDatabase::~SKQtRealTimeDatabase()
{
    _manager->deleteLater();
}

QJsonDocument SKQtRealTimeDatabase::getData()
{
    QString json = _reply->readAll();
    QJsonDocument temp = QJsonDocument::fromJson(json.toUtf8());
    qDebug()<<"json : "<<temp;
    return temp;
}
