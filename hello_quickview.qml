import QtQuick
import QtCharts

Item {
    width: 640
    height: 480

    ChartView {
        anchors.fill: parent
        legend.visible: false

        PieSeries {
            id: pieSeries
            PieSlice { label: "Slice 1"; value: 10 }
            PieSlice { label: "Slice 2"; value: 20 }
        }
    }
}
