#include <QtGui/QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QVariantMap>
#include "playstream.h"
#include "request.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    PlayStream myClass;
    QDeclarativeContext *context = myClass.rootContext();
    context->setContextProperty("PlayStream", &myClass);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}



