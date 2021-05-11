import 'package:cryptoo/core/models/weekly-crpyto.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/models/crypto.model.dart';

class LineSceeen extends StatefulWidget {
  final CryptoModel cryptoModel;
  final List<WeeklyCryptoModel> list;

  const LineSceeen({Key key, this.cryptoModel, this.list}) : super(key: key);
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
    print(widget.cryptoModel.priceUsd);
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
        primaryYAxis: NumericAxis(numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      ),
    );
  }

  List<PriceData> getPriceData() {
    final List<PriceData> chartData = [
      PriceData(2019, 2000),
      PriceData(2020, 18200),
      PriceData(2021, widget.cryptoModel.priceUsd),
    ];
    return chartData;
  }
}

class PriceData {
  final double year;
  final double price;
  PriceData(this.year, this.price);
}
