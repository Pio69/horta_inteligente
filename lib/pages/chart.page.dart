/// Example app for flutter_charts.
///
/// All classes without prefix in this code are either
/// - from material.dart or
/// - from flutter_charts.dart exports (this library)
/// Also, material.dart exports many dart files, including widgets.dart,
/// so Widget classes are referred to without prefix
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuple/tuple.dart' show Tuple2;
import 'dart:io' as io show exit;
import 'package:flutter_charts/flutter_charts.dart';

import 'dart:ui' as ui show Color;

chartToRun() {
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();
  // Example shows an explicit use of the DefaultIterativeLabelLayoutStrategy.
  // The xContainerLabelLayoutStrategy, if set to null or not set at all,
  //   defaults to DefaultIterativeLabelLayoutStrategy
  // Clients can also create their own LayoutStrategy.
  xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
    options: chartOptions,
  );
  chartData = ChartData(
    dataRows: const [
      [10.0, 20.0, 5.0, 30.0, 5.0, 20.0],
      [30.0, 60.0, 16.0, 100.0, 12.0, 120.0],
      [25.0, 40.0, 20.0, 80.0, 12.0, 90.0],
      [12.0, 30.0, 18.0, 40.0, 10.0, 30.0],
    ],
    xUserLabels: const ['Wolf', 'Deer', 'Owl', 'Mouse', 'Hawk', 'Vole'],
    dataRowsLegends: const [
      'Spring',
      'Summer',
      'Fall',
      'Winter',
    ],
    chartOptions: chartOptions,
  );
  // chartData.dataRowsDefaultColors(); // if not set, called in constructor
  var lineChartContainer = LineChartTopContainer(
    chartData: chartData,
    xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
  );

  var lineChart = LineChart(
    painter: LineChartPainter(
      lineChartContainer: lineChartContainer,
    ),
  );
  return lineChart;
}
