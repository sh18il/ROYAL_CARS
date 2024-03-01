import 'package:flutter/material.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'package:royalcars/service/function.dart';

class MediumCarsProvider extends ChangeNotifier {
  String _search = "";
  List<MediumCarsModel> _searchedList = [];

  String get search => _search;
  List<MediumCarsModel> get searchedList => _searchedList;

  void updateSearchedList(String searched) {
    _search = searched;
    _searchedList = carsMediumListNotifier
        .where((car) => car.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
