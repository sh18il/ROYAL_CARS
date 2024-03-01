import 'package:flutter/material.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/service/function.dart';

class LuxuryCarsProvider extends ChangeNotifier {
  String _search = "";
  List<CarsModel> searchedList = [];
 

  String get search => _search;
 

  void updateSearchedList(String searched) {
    _search = searched;
    searchedList = carsListNotifier
        .where((car) => car.name.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    notifyListeners();
  }

  


}
