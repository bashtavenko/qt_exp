#include "glog/logging.h"
#include "gflags/gflags.h"
#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
#include <QtCore/QDir>
#include <QtQml/QQmlEngine>
#include <memory>

int main(int argc, char** argv) {
  google::InitGoogleLogging(argv[0]);
  gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);
  gflags::SetCommandLineOption("logtostderr", "1");

  QGuiApplication app(argc, argv);

  auto view =  std::make_unique<QQuickView>();
  view->setSource(QUrl::fromLocalFile("hello_quickview.qml"));
  view->show();
  return app.exec();
}