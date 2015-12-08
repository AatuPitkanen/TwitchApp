#include "playstream.h"

PlayStream::PlayStream(QObject *parent) :

QObject(parent),
m_process(new QProcess(this))
{
}
//Opens videoplayer with medium quality
void PlayStream :: playvideo(char url) {
    QProcess sh;
    sh.start("sh", QStringList() << "-c" <<"livestreamer twitch.tv/cereth medium");
    QByteArray output = sh.readAll();
    sh.waitForFinished();
    sh.close();
}
