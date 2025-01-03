#include "glog/logging.h"
#include "gflags/gflags.h"

#include <QtWidgets/QApplication>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QLabel>

int main(int argc, char** argv) {
  google::InitGoogleLogging(*argv);
  gflags::ParseCommandLineFlags(&argc, &argv, /*remove_flags=*/true);

  QApplication app(argc, argv);

  QMainWindow window;
  QLabel* label = new QLabel("Hello, World!", &window);
  window.setCentralWidget(label);
  window.resize(250, 100);
  window.show();

  return app.exec();
}