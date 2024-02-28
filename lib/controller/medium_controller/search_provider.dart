import 'package:flutter/material.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'package:royalcars/service/function.dart';

class mediumCarsProvider extends ChangeNotifier {
  // String searchm = "";
  // List<MediumCarsModel> searchedListm = [];


  // void searchListUpdatem(String search) {
   
  //   searchedListm = .value
  //       .where((MediumCarsModel) =>
  //           MediumCarsModel.name.toLowerCase().contains(searchm.toLowerCase()))
  //       .toList();
  //   notifyListeners();
  // }
  // void updateSearchedList(String searched) {
  //   searchm = searched;
  // searchedListm = carsMediumListNotifier
  //       .where((car) => car.name.toLowerCase().contains(searchm.toLowerCase()))
  //       .toList();
  //   notifyListeners();
  // }
   String _search = "";
  List<MediumCarsModel> _searchedList = [];
  // List<T> _vehcleList = [];

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
