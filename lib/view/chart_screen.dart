import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/chart_provider.dart'; // Adjusted import
import 'package:royalcars/service/function.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChartProvider>(
      builder: (context, chartProvider, _) {
        chartProvider.updateValues();
        final Map<String, double> dataMap = {
          'Low': chartProvider.totalLowcars,
          'Medium': chartProvider.totalmediumcars,
          'Luxury': chartProvider.totallaxurycars,
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
      },
    );
  }
}
