import 'package:flutter/material.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/view/add_screen.dart';

enum vehcleCatogary { loxury, medium, low }

class LuxuryCarsProvider extends ChangeNotifier {
  String _search = "";
  List<CarsModel> _searchedList = [];
  // List<T> _vehcleList = [];

  String get search => _search;
  List<CarsModel> get searchedList => _searchedList;

  void updateSearchedList(String searched) {
    _search = searched;
    _searchedList = carsListNotifier
        .where((car) => car.name.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
