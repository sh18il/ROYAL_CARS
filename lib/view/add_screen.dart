import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'widgets/editpage.dart';

class AddScrees extends StatefulWidget {
  const AddScrees({super.key});
 @override
  State<AddScrees> createState() => _AddScreesState();
}
// ignore: constant_identifier_names
enum DataBases { LuxuryDb, MediumDb, LowDb }
class _AddScreesState extends State<AddScrees> {
  DataBases selectedDatabase = DataBases.LuxuryDb;
  final nameContrl = TextEditingController();
  final modelContrl = TextEditingController();
  final kmContrl = TextEditingController();
  final dlNumberContrl = TextEditingController();
  
  final ownerContrl = TextEditingController();
  final priceContrl = TextEditingController();
  final futureContrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text("ADD CARS",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 180,
                height: 130,
                child: Image(
                  image: _selectImage != null
                      ? FileImage(_selectImage!)
                      : const AssetImage("image/carr1.png") as ImageProvider,
                ),
              ),
            ),
            const Text('ADD CAR PHOTO'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 151, 110, 34)),
                    onPressed: () {
                      _pickImgGallery(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY")),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 151, 110, 34)),
                    onPressed: () {
                      _pickImgGallery(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("CAMERA")),
              ],
            ),
            const Gap(30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      addFormFieldW(
                          width: 172,
                          keyboardType: TextInputType.text,
                          hintText: 'NAME',
                          controller: nameContrl,
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.red, Colors.green],
                          )),
                      addFormFieldW(
                          width: 107,
                          keyboardType: TextInputType.number,
                          hintText: 'MODEL',
                          controller: modelContrl,
                          gradient: const LinearGradient(
                            colors: [Colors.yellow, Colors.red, Colors.blue],
                          )),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      addFormFieldW(
                          width: 119,
                          keyboardType: TextInputType.number,
                          hintText: 'KM',
                          controller: kmContrl,
                          gradient: const LinearGradient(
                            colors: [Colors.green, Colors.red, Colors.black],
                          )),
                      addFormFieldW(
                          width: 146,
                          keyboardType: TextInputType.multiline,
                          hintText: 'DL NUMBER',
                          controller: dlNumberContrl,
                          gradient: const LinearGradient(
                            colors: [Colors.green, Colors.red, Colors.black],
                          )),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      addFormFieldW(
                        width: 107,
                        keyboardType: TextInputType.number,
                        hintText: 'OWNERSHIP',
                        controller: ownerContrl,
                        gradient: const LinearGradient(
                          colors: [Colors.green, Colors.red, Colors.black],
                        ),
                      ),
                      addFormFieldW(
                          width: 174,
                          keyboardType: TextInputType.number,
                          hintText: 'PRICE',
                          controller: priceContrl,
                          gradient: const LinearGradient(
                            colors: [Colors.green, Colors.red, Colors.black],
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      DropdownButton<DataBases>(
                        value: selectedDatabase,
                        items: const [
                          DropdownMenuItem(
                            value: DataBases.LuxuryDb,
                            child: Text('Luxury'),
                          ),
                          DropdownMenuItem(
                            value: DataBases.MediumDb,
                            child: Text('MEDIUM'),
                          ),
                          DropdownMenuItem(
                            value: DataBases.LowDb,
                            child: Text('LOW'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedDatabase = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const Gap(30),
                  addFormFieldW(
                      width: 223,
                      keyboardType: TextInputType.text,
                      hintText: 'FUETERS',
                      controller: futureContrl,
                      gradient: const LinearGradient(
                        colors: [Colors.green, Colors.red, Colors.black],
                      )),
                  const Gap(30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(237, 248, 66, 5),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onAddCarsButn();
                      }
                    },
                    child: const Text('SUBMIT'),
                  ),
                  const Gap(30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
          image: _selectImage!.path);

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
          image: _selectImage!.path);

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
          image: _selectImage!.path);

      addCar(DataBases.LowDb, cars);
    }
  }

  // ignore: non_constant_identifier_names
  Future _pickImgGallery(ImageSource) async {
    final returnImg = await ImagePicker().pickImage(source: ImageSource);

    if (returnImg == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImg.path);
    });
  }
}
