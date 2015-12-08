#ifndef PLAYSTREAM_H
#define PLAYSTREAM_H
#include <QProcess>
#include <QObject>

class PlayStream: public QObject{
    Q_OBJECT
 public:
     explicit PlayStream (QObject* parent = 0);
     Q_INVOKABLE void playvideo(char url);
 private:
     QProcess *m_process;
};

#endif // PLAYSTREAM_H
