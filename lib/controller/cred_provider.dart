import 'package:flutter/material.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/service/function.dart';

class CredProvider extends ChangeNotifier {
  deletFunction(type, index) {
    deleteCar(type, index);
    getAllCars(type);
    notifyListeners();
  }

  updateCarList(DataBases type) {
    getAllCars(type);
    notifyListeners();
  }
}
