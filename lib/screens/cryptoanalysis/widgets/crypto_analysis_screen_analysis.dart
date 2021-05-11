import 'dart:ffi';

import 'package:cryptoo/core/database-helper.dart';
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
  List<WeeklyCryptoModel> _chartList;
  List<PriceData> _pricesData = [];
  TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    getPriceData();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cryptoModel.priceUsd);
    return Container(
      child: SfCartesianChart(
        title: ChartTitle(text: 'Weekly crypto prices'),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<PriceData, String>(
              dataSource: _pricesData,
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

  Future<List<PriceData>> getPriceData() async {
    _chartList = await DatabaseHelper.instance.getCryptoPrices(widget.cryptoModel.symbol);
    // for (var i = 0; i < _chartList.length; i++) {
    PriceData model = PriceData('2021-05-10', 1000);
    PriceData model1 = PriceData('2021-05-11', 1100);

    _pricesData.add(model);
    _pricesData.add(model1);
    // }
  }
}

class PriceData {
  final String year;
  final double price;
  PriceData(this.year, this.price);
}
