import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/luxury_controller/edit_luxury_provider.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/view/widgets/editpage.dart';

class EditLuxury extends StatelessWidget {
  final String name;
  final String model;
  final String km;
  final int index;
  final String dlnbr;
  final String owner;
  final String price;
  final String future;
  final dynamic imagepath;

  const EditLuxury({
    Key? key,
    required this.name,
    required this.model,
    required this.km,
    required this.index,
    required this.dlnbr,
    required this.owner,
    required this.price,
    required this.future,
    required this.imagepath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditLuxuryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text(
            "EDIT CARS",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              Center(
                child: SizedBox(
                  height: 200,
                  child:  Image(
                    image: provider.selectImage != null
                        ? FileImage(provider.selectImage!)
                        : const AssetImage("image/carr1.png") as ImageProvider,
                  ),
                ),
              ),
              const Gap(20),
              const Text('EDIT CAR PHOTO'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 161, 133, 168),
                    ),
                    onPressed: provider.pickImgGallery,
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 184, 151, 192),
                    ),
                    onPressed: provider.pickImageFromCam,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("CAMERA"),
                  ),
                ],
              ),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(
                        controller: provider.nameContrl..text = name,
                        hintText: 'NAME',
                      ),
                      FormFieldBuild(
                        controller: provider.modelContrl..text = model,
                        hintText: 'MODEL',
                      ),
                    ],
                  ),
                  const Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(
                        controller: provider.kmContrl..text = km,
                        hintText: 'KM',
                      ),
                      FormFieldBuild(
                        controller: provider.dlNumberContrl..text = dlnbr,
                        hintText: 'DL NUMBER',
                      ),
                    ],
                  ),
                  const Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(
                        controller: provider.ownerContrl..text = owner,
                        hintText: 'OWNERSHIP',
                      ),
                      FormFieldBuild(
                        controller: provider.priceContrl..text = price,
                        hintText: 'PRICE',
                      ),
                    ],
                  ),
                  const Gap(7),
                  FormFieldBuild(
                    controller: provider.futureContrl..text = future,
                    hintText: 'FUETERS',
                  ),
                ],
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () {
                 provider.updateAll(
  name: name,
  model: model,
  km: km,
  dlnbr: dlnbr,
  owner: owner,
  price: price,
  future: future,
  imagepath: imagepath,
  index: index,
);

                  Navigator.pop(context);
                },
                child: const Text('SUBMIT'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
