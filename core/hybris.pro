QT += network

TEMPLATE = lib
TARGET = hybrissensorfw

include( ../common-config.pri )

SENSORFW_INCLUDEPATHS = .. \
                        ../include \
                        ../filters \
                        ../datatypes

DEPENDPATH += $$SENSORFW_INCLUDEPATHS
INCLUDEPATH += $$SENSORFW_INCLUDEPATHS

SOURCES += hybrisadaptor.cpp
HEADERS += hybrisadaptor.h
LIBS += -L$$[QT_INSTALL_LIBS] -L../datatypes -lsensordatatypes-qt5 -L. -lsensorfw-qt5

CONFIG += link_pkgconfig

!contains(CONFIG,binder) {
    LIBS += -lhybris-common
    PKGCONFIG += android-headers libhardware
}

include(../common-install.pri)
target.path = $$SHAREDLIBPATH
INSTALLS += target
