import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'dart:io';

import 'package:royalcars/service/function.dart';

// ignore: constant_identifier_names
enum DataBases { LuxuryDb, MediumDb, LowDb }

class AddCarProvider extends ChangeNotifier {
  final nameContrl = TextEditingController();
  final modelContrl = TextEditingController();
  final kmContrl = TextEditingController();
  final dlNumberContrl = TextEditingController();

  final ownerContrl = TextEditingController();
  final priceContrl = TextEditingController();
  final futureContrl = TextEditingController();
  DataBases selectedDatabase = DataBases.LuxuryDb;
  File? selectedImage;


  Future<void> onAddCarsButn() async {
    if (selectedDatabase == DataBases.LuxuryDb) {
      final name = nameContrl.text;
      final model = modelContrl.text;
      final km = kmContrl.text;
      final dlnbr = dlNumberContrl.text;
      final owner = ownerContrl.text;
      final price = priceContrl.text;
      final future = futureContrl.text;

      if (name.isEmpty ||
          model.isEmpty ||
          km.isEmpty ||
          dlnbr.isEmpty ||
          owner.isEmpty ||
          price.isEmpty ||
          future.isEmpty) {
        return;
      }

      final cars = CarsModel(
          name: name,
          model: model,
          km: km,
          dlnumber: dlnbr,
          owner: owner,
          price: price,
          future: future,
          image: selectedImage!.path);

      addCar(DataBases.LuxuryDb, cars);
    } else if (selectedDatabase == DataBases.MediumDb) {
      final name = nameContrl.text;
      final model = modelContrl.text;
      final km = kmContrl.text;
      final dlnbr = dlNumberContrl.text;
      final owner = ownerContrl.text;
      final price = priceContrl.text;
      final future = futureContrl.text;

      if (name.isEmpty ||
          model.isEmpty ||
          km.isEmpty ||
          dlnbr.isEmpty ||
          owner.isEmpty ||
          price.isEmpty ||
          future.isEmpty) {
        return;
      }

      final cars = MediumCarsModel(
          name: name,
          model: model,
          km: km,
          dlnumber: dlnbr,
          owner: owner,
          price: price,
          future: future,
          image: selectedImage!.path);

      addCar(DataBases.MediumDb, cars);
    } else if (selectedDatabase == DataBases.LowDb) {
      final name = nameContrl.text;
      final model = modelContrl.text;
      final km = kmContrl.text;
      final dlnbr = dlNumberContrl.text;
      final owner = ownerContrl.text;
      final price = priceContrl.text;
      final future = futureContrl.text;

      if (name.isEmpty ||
          model.isEmpty ||
          km.isEmpty ||
          dlnbr.isEmpty ||
          owner.isEmpty ||
          price.isEmpty ||
          future.isEmpty) {
        return;
      }

      final cars = LowCarsModel(
          name: name,
          model: model,
          km: km,
          dlnumber: dlnbr,
          owner: owner,
          price: price,
          future: future,
          image: selectedImage!.path);

      addCar(DataBases.LowDb, cars);
    }
  }

  void pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      notifyListeners();
    }
  }

  void clearImage() {
    selectedImage = null;
    notifyListeners();
  }

  selectDb(value) {
    selectedDatabase = value!;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
   Clear() {
    nameContrl.clear();

    modelContrl.clear();

    kmContrl.clear();

    dlNumberContrl.clear();
    ownerContrl.clear();

    priceContrl.clear();

    futureContrl.clear();
    selectedImage == null;
  }
}
