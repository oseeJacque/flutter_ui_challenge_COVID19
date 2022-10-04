import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {required this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return  DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 0));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Statistic, int>> _createSampleData() {
    final data = [
      Statistic(0, 25,Colors.redAccent ),
      Statistic(1, 75,Colors.yellowAccent),
      Statistic(2, 150,Colors.blueAccent),
      
    ];

    return [
       charts.Series<Statistic, int>(
        id: 'Statistic',
        domainFn: (Statistic Statistic, _) => Statistic.id,
        measureFn: (Statistic Statistic, _) => Statistic.value,
        colorFn: (Statistic Statistic, _)=>charts.ColorUtil.fromDartColor( Statistic.color),
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class Statistic {
  final int id;
  final int value;
  final Color color;

  Statistic(this.id, this.value,this.color);
}