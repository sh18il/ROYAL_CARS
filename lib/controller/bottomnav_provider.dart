import 'package:flutter/material.dart';
import 'package:royalcars/view/add_screen.dart';
import 'package:royalcars/view/chart_screen.dart';
import 'package:royalcars/view/home_screen.dart';

import '../view/settings.dart';

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    AddScrees(),
    const ChartScreen(),
    Settings(),
  ];
 
  // ignore: non_constant_identifier_names
  UpdateIndex(newIndex) {
   currentIndex = newIndex;
    notifyListeners();
  }
}
