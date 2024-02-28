import 'package:flutter/material.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/view/add_screen.dart';

class CredProvider extends ChangeNotifier {
  deletFu(type, index) {
    deleteCar(type, index);
    getAllCars(type);
    notifyListeners();
  }

  updateCarList(DataBases type) {
    getAllCars(type);
    notifyListeners();
  }

 
}
