#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include "gflags/gflags.h"
#include "glog/logging.h"

int main(int argc, char **argv) {
  google::InitGoogleLogging(*argv);
  gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);
  gflags::SetCommandLineOption("logtostderr", "1");

  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;
  engine.load(QUrl::fromLocalFile("hello.qml"));
  if (engine.rootObjects().isEmpty()) {
    LOG(ERROR) << "Failed to load QML";
    return EXIT_FAILURE;
  }

  return app.exec();
}

