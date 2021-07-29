QT += quick network qml

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/settings.gradle\
    android/res/values/libs.xml

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}



android {
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/settings.gradle\
    android/res/values/libs.xml

  LIBS += -L"C:/Users/assou/Desktop/SKQtFirebase/build-SKQtFirebase-Android_Qt_6_2_0_Clang_arm64_v8a-Debug/SKQtFirebase" -lSKQtFirebase_arm64-v8a
}



android: include(C:/android_sdk/android_openssl/openssl.pri)

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../QtModue/build-SKQtFirebase-Desktop_Qt_6_2_0_MSVC2019_64bit-Debug/SKQtFirebase/release/ -lSKQtFirebase
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../QtModue/build-SKQtFirebase-Desktop_Qt_6_2_0_MSVC2019_64bit-Debug/SKQtFirebase/debug/ -lSKQtFirebase

INCLUDEPATH += $$PWD/../../QtModue/SKQtFirebase/SKQtFirebase
DEPENDPATH += $$PWD/../../QtModue/SKQtFirebase/SKQtFirebase
