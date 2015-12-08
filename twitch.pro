TEMPLATE = app
QT += network
QT += core
QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    playstream.cpp \
    request.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    playstream.h \
    request.h

