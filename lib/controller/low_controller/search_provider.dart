import 'package:flutter/material.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/service/function.dart';

class LowCarsProvider extends ChangeNotifier {
  String _search = "";
  List<LowCarsModel> _searchedList = [];
  // List<T> _vehcleList = [];

  String get search => _search;
  List<LowCarsModel> get searchedList => _searchedList;

  void updateSearchedList(String searched) {
    _search = searched;
    _searchedList = carsLowListNotifier
        .where((car) => car.name.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    notifyListeners();
  }
}