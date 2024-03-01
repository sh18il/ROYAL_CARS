import 'package:flutter/material.dart';
import 'package:royalcars/service/function.dart';

class ChartProvider extends ChangeNotifier {
  late double totalmediumcars;
  late double totallaxurycars;
  late double totalLowcars;

  updateValues() {
    totalmediumcars = Chartfucntion.totalMedi;
    totallaxurycars = Chartfucntion.totals;
    totalLowcars = Chartfucntion.totalLow;

    
  }
}
