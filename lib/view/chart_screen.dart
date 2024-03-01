import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/chart_provider.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('chartttt');
    final provider = Provider.of<ChartProvider>(context, listen: false);
    provider.updateValues();
    final Map<String, double> dataMap = {
      'Low': provider.totalLowcars,
      'Medium': provider.totalmediumcars,
      'Luxury': provider.totallaxurycars,
    };

    final List<Color> colorList = [
      const Color.fromARGB(255, 135, 155, 145),
      const Color.fromARGB(255, 8, 11, 15),
      const Color.fromARGB(255, 101, 51, 51),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text("CAR BUDGET ANALYSIS")),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          ringStrokeWidth: 22,
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartRadius: MediaQuery.of(context).size.width / 1.6,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
          ),
        ),
      ),
    );
  }
}
