#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include "gflags/gflags.h"
#include "glog/logging.h"

int main(int argc, char **argv) {
  google::InitGoogleLogging(*argv);
  gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);
  gflags::SetCommandLineOption("logtostderr", "1");

  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine("hello.qml");
  return app.exec();
}
