#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSettings>
#include <QQmlContext>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setOrganizationName("tm70");
    app.setOrganizationDomain("https://github.com/tm70");
    app.setApplicationName("Voicebox");
    QSettings::setDefaultFormat(QSettings::IniFormat);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("applicationDirPath", QGuiApplication::applicationDirPath());

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
