import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';

class EditLuxuryProvider extends ChangeNotifier {
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
    required dynamic imagepath,
    required int index,
  }) async {
    final namelx = nameContrl.text.isEmpty ? name : nameContrl.text;
    final modellx = modelContrl.text.isEmpty ? model : modelContrl.text;
    final kmlx = kmContrl.text.isEmpty ? km : kmContrl.text;
    final dlnbrlx = dlNumberContrl.text.isEmpty ? dlnbr : dlNumberContrl.text;
    final ownerlx = ownerContrl.text.isEmpty ? owner : ownerContrl.text;
    final pricelx = priceContrl.text.isEmpty ? price : priceContrl.text;
    final futurelx = futureContrl.text.isEmpty ? future : futureContrl.text;
    final imagelx = selectImage?.path ?? imagepath;

    if (namelx.isEmpty ||
        modellx.isEmpty ||
        kmlx.isEmpty ||
        dlnbrlx.isEmpty ||
        ownerlx.isEmpty ||
        pricelx.isEmpty ||
        futurelx.isEmpty ||
        imagelx.isEmpty) {
      return;
    } else {
      final update = CarsModel(
        name: namelx,
        model: modellx,
        km: kmlx,
        dlnumber: dlnbrlx,
        owner: ownerlx,
        price: pricelx,
        future: futurelx,
        image: imagelx,
      );
      editCarsList(DataBases.LuxuryDb, index, update);
      notifyListeners();
    }
  }

  void editCarsList(dynamic type, int index, CarsModel value) {
    editCar(type, index, value);
    getAllCars(type);
    notifyListeners();
  }
}
