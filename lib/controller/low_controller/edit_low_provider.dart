
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/service/function.dart';

class EditLowProvider extends ChangeNotifier {
  final TextEditingController nameContrl = TextEditingController();
  final TextEditingController modelContrl = TextEditingController();
  final TextEditingController kmContrl = TextEditingController();
  final TextEditingController dlNumberContrl = TextEditingController();
  final TextEditingController ownerContrl = TextEditingController();
  final TextEditingController priceContrl = TextEditingController();
  final TextEditingController futureContrl = TextEditingController();

  File? selectImage;

   pickImgGallery() async {
    final returnImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImg != null) {
      selectImage = File(returnImg.path);
      notifyListeners();
    }
  }

   pickImageFromCam() async {
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
    final namelow = nameContrl.text.isEmpty ? name : nameContrl.text;
    final modellow = modelContrl.text.isEmpty ? model : modelContrl.text;
    final kmlow = kmContrl.text.isEmpty ? km : kmContrl.text;
    final dlnbrlow = dlNumberContrl.text.isEmpty ? dlnbr : dlNumberContrl.text;
    final ownerlow = ownerContrl.text.isEmpty ? owner : ownerContrl.text;
    final pricelow = priceContrl.text.isEmpty ? price : priceContrl.text;
    final futurelow = futureContrl.text.isEmpty ? future : futureContrl.text;
    final imagelow = selectImage?.path ?? imagepath;

    if (namelow.isEmpty ||
        modellow.isEmpty ||
        kmlow.isEmpty ||
        dlnbrlow.isEmpty ||
        ownerlow.isEmpty ||
        pricelow.isEmpty ||
        futurelow.isEmpty ||
        imagelow.isEmpty) {
      return;
    } else {
      final update = LowCarsModel(
        name: namelow,
        model: modellow,
        km: kmlow,
        dlnumber: dlnbrlow,
        owner: ownerlow,
        price: pricelow,
        future: futurelow,
        image: imagelow,
      );
      editCarsList(DataBases.LowDb, index, update);
      notifyListeners();
    }
  }

  void editCarsList(dynamic type, int index, LowCarsModel value) {
    editCar(type, index, value);
    getAllCars(type);
    notifyListeners();
  }
}
