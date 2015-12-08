#include "request.h"
#include <QCoreApplication>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariantMap>
#include <QJsonArray>
#include <QProcess>

Request::Request()
{

        // create custom temporary event loop on stack
        QEventLoop eventLoop;

        // "quit()" the event-loop, when the network request "finished()"
        QNetworkAccessManager mgr;
        QObject::connect(&mgr, SIGNAL(finished(QNetworkReply*)), &eventLoop, SLOT(quit()));

        // the HTTP request
        QNetworkRequest req( QUrl( QString("https://api.twitch.tv/kraken/streams/featured") ) );
        QNetworkReply *reply = mgr.get(req);
        eventLoop.exec(); // blocks stack until "finished()" has been called();

        if (reply->error() == QNetworkReply::NoError) {

                QString strReply = (QString)reply->readAll();

                //parse json
                //qDebug() << "Response:" << strReply;
                QJsonDocument jsonResponse = QJsonDocument::fromJson(strReply.toUtf8());
                QStringList propertyNames;
                QStringList propertyKeys;
                QJsonObject jsonObj = jsonResponse.object();
                QJsonArray jsonArray = jsonObj["properties"].toArray();

                foreach (const QJsonValue & value, jsonArray) {
                    QJsonObject obj = value.toObject();
                    propertyNames.append(obj["PropertyName"].toString());
                    propertyKeys.append(obj["key"].toString());
                }
    ;
                qDebug() << "Streams:" << jsonArray;

                delete reply;
        }
        else {
            //failure
            qDebug() << "Failure" <<reply->errorString();
            delete reply;
        }
    }


