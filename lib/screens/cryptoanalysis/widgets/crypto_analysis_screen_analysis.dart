import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class LineSceeen extends StatefulWidget {
  @override
  _LineSceeenState createState() => _LineSceeenState();
}

class _LineSceeenState extends State<LineSceeen> {
  List<PriceData> _chartList;
  TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartList = getPriceData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        title: ChartTitle(text: 'Weekly crypto prices'),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<PriceData, double>(
              dataSource: _chartList,
              xValueMapper: (PriceData price, _) => price.year,
              yValueMapper: (PriceData price, _) => price.price,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      ),
    );
  }

  List<PriceData> getPriceData() {
    final List<PriceData> chartData = [
      PriceData(2018, 50),
      PriceData(2019, 300),
      PriceData(2020, 100),
      PriceData(2021, 50),
    ];
    return chartData;
  }
}

class PriceData {
  final double year;
  final double price;
  PriceData(this.year, this.price);
}
