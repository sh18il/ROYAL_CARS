import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'widgets/editpage.dart';

class AddScrees extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCarProvider>(builder: (context, provider, child) {
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
                    image: provider.selectedImage != null
                        ? FileImage(provider.selectedImage!)
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
                        provider.pickImage(ImageSource.gallery);
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("GALLERY")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 151, 110, 34)),
                      onPressed: () {
                        provider.pickImage(ImageSource.camera);
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
                            controller: provider.nameContrl,
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.red, Colors.green],
                            )),
                        addFormFieldW(
                            width: 107,
                            keyboardType: TextInputType.number,
                            hintText: 'MODEL',
                            controller: provider.modelContrl,
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
                            controller: provider.kmContrl,
                            gradient: const LinearGradient(
                              colors: [Colors.green, Colors.red, Colors.black],
                            )),
                        addFormFieldW(
                            width: 146,
                            keyboardType: TextInputType.multiline,
                            hintText: 'DL NUMBER',
                            controller: provider.dlNumberContrl,
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
                          controller: provider.ownerContrl,
                          gradient: const LinearGradient(
                            colors: [Colors.green, Colors.red, Colors.black],
                          ),
                        ),
                        addFormFieldW(
                            width: 174,
                            keyboardType: TextInputType.number,
                            hintText: 'PRICE',
                            controller: provider.priceContrl,
                            gradient: const LinearGradient(
                              colors: [Colors.green, Colors.red, Colors.black],
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        DropdownButton<DataBases>(
                          value: provider.selectedDatabase,
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
                            provider.selectDb(value);
                          },
                        ),
                      ],
                    ),
                    const Gap(30),
                    addFormFieldW(
                        width: 223,
                        keyboardType: TextInputType.text,
                        hintText: 'FUETERS',
                        controller: provider.futureContrl,
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
                          provider.onAddCarsButn();
                          provider.Clear();
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
    });
  }
}
