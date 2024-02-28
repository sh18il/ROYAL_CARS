import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'package:royalcars/service/function.dart';

class MediumLuxuryProvider extends ChangeNotifier {
  final TextEditingController nameContrl = TextEditingController();
  final TextEditingController modelContrl = TextEditingController();
  final TextEditingController kmContrl = TextEditingController();
  final TextEditingController dlNumberContrl = TextEditingController();
  final TextEditingController ownerContrl = TextEditingController();
  final TextEditingController priceContrl = TextEditingController();
  final TextEditingController futureContrl = TextEditingController();

  File? selectImage;

  void pickImgGallery() async {
    final returnImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImg != null) {
      selectImage = File(returnImg.path);
      notifyListeners();
    }
  }

  void pickImageFromCam() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnImage != null) {
      selectImage = File(returnImage.path);
      notifyListeners();
    }
  }

  Future<void> updateAll({
    required String name,
    required String model,
    required String km,
    required String dlnbr,
    required String owner,
    required String price,
    required String future,
    required String imagepath,
    required int index,
  }) async {
    final namemedium = nameContrl.text.isEmpty ? name : nameContrl.text;
    final modelmedium = modelContrl.text.isEmpty ? model : modelContrl.text;
    final kmmedium = kmContrl.text.isEmpty ? km : kmContrl.text;
    final dlnbrmedium = dlNumberContrl.text.isEmpty ? dlnbr : dlNumberContrl.text;
    final ownermedium= ownerContrl.text.isEmpty ? owner : ownerContrl.text;
    final pricemedium = priceContrl.text.isEmpty ? price : priceContrl.text;
    final futuremedium = futureContrl.text.isEmpty ? future : futureContrl.text;
    final imagemedium = selectImage?.path ?? imagepath;

    if (namemedium.isEmpty ||
        modelmedium.isEmpty ||
        kmmedium.isEmpty ||
        dlnbrmedium.isEmpty ||
        ownermedium.isEmpty ||
        pricemedium.isEmpty ||
        futuremedium.isEmpty ||
        imagemedium.isEmpty) {
      return;
    } else {
      final update = MediumCarsModel(
        name: namemedium,
        model: modelmedium,
        km: kmmedium,
        dlnumber: dlnbrmedium,
        owner: ownermedium,
        price: pricemedium,
        future: futuremedium,
        image: imagemedium,
      );
      editCarsList(DataBases.MediumDb, index, update);
      notifyListeners();
    }
  }

  void editCarsList(dynamic type, int index, MediumCarsModel value) {
    editCar(type, index, value);
    getAllCars(type);
    notifyListeners();
  }
}