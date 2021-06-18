import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Satis extends StatefulWidget {
  final double n1;
  final double n2;
  final double n3;
  final double n4;
  final double n5;

  Satis({
    Key? key,
    required this.n1,
    required this.n2,
    required this.n3,
    required this.n4,
    required this.n5,
  }) : super(key: key);

  @override
  _SatisState createState() => _SatisState();
}

class _SatisState extends State<Satis> {
  // double n1 = 1;
  // double n2 = 1;
  // double n3 = 1;
  // double n4 = 1;
  // double n5 = 1;

  List<_SalesData> data = [];

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  double randomUret() {
    Random random = new Random();
    double rndNumber = random.nextInt(40).toDouble();
    rndNumber = rndNumber + 50;
    return rndNumber;
  }

  @override
  void initState() {
    super.initState();
    // n1 = randomUret();
    // n2 = randomUret();
    // n3 = randomUret();
    // n4 = randomUret();
    // n5 = randomUret();

    data = [
      _SalesData('Şubat', widget.n1),
      _SalesData('Mart', widget.n2),
      _SalesData('Nisan', widget.n3),
      _SalesData('Mayis', widget.n4),
      _SalesData('Haziran', widget.n5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Satış Miktari'),
      ),
      body: SafeArea(
        child: Container(
          child: Card(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Son 5 aydaki satış miktari'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Satış',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
