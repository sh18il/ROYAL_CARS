import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:royalcars/service/function.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late double totalmediumcars;
  late double totallaxurycars;
  late double totalLowcars;

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  void updateValues() {
    setState(() {
      totalmediumcars = Chartfucntion.totalMedi;
      totallaxurycars = Chartfucntion.totals;
      totalLowcars = Chartfucntion.totalLow;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      'Low': totalLowcars,
      'Medium': totalmediumcars,
      'Luxury': totallaxurycars,
    };

    final List<Color> colorList = [
      const Color.fromARGB(255, 135, 155, 145),
      const Color.fromARGB(255, 8, 11, 15),
      const Color.fromARGB(255, 101, 51, 51),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text("CAR BUDJET ANALYSIS")),
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
