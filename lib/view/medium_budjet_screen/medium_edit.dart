// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/service/function.dart';

import 'package:royalcars/model/mediumcar/medium_cars_model.dart';


import '../add_screen.dart';
import '../widgets/editpage.dart';

class MediumEditScreen extends StatefulWidget {
  String name;
  String model;
  String km;
  int index;
  String dlnbr;
  String owner;
  String price;
  String future;
  dynamic imagepath;
  MediumEditScreen({
    super.key,
    required this.name,
    required this.model,
    required this.km,
    required this.index,
    required this.dlnbr,
    required this.owner,
    required this.price,
    required this.future,
    required this.imagepath,
  });

  @override
  State<MediumEditScreen> createState() => _MediumEditScreenState();
}

class _MediumEditScreenState extends State<MediumEditScreen> {
  TextEditingController nameContrl = TextEditingController();
  TextEditingController modelContrl = TextEditingController();
  TextEditingController kmContrl = TextEditingController();
  TextEditingController dlNumberContrl = TextEditingController();
  TextEditingController ownerContrl = TextEditingController();
  TextEditingController priceContrl = TextEditingController();
  TextEditingController futureContrl = TextEditingController();

  File? _selectImage;

  @override
  void initState() {
    nameContrl = TextEditingController(text: widget.name);
    modelContrl = TextEditingController(text: widget.model);
    kmContrl = TextEditingController(text: widget.km);
    dlNumberContrl = TextEditingController(text: widget.dlnbr);
    ownerContrl = TextEditingController(text: widget.owner);
    priceContrl = TextEditingController(text: widget.price);
    futureContrl = TextEditingController(text: widget.future);
    _selectImage = widget.imagepath != '' ? File(widget.imagepath) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text("EDIT CARS",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 25, 25, 81),
                    backgroundImage: _selectImage != null
                        ? FileImage(_selectImage!)
                        : const AssetImage("image/rolss.png") as ImageProvider,
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
                          backgroundColor:
                              const Color.fromARGB(255, 161, 133, 168)),
                      onPressed: () {
                        _pickImgGallery();
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("GALLERY")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 184, 151, 192)),
                      onPressed: () {
                        _pickImageFromCam();
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text("CAMERA")),
                ],
              ),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(controller: nameContrl, hintText: 'NAME'),
                      FormFieldBuild(
                          controller: modelContrl, hintText: 'MODEL'),
                    ],
                  ),
                  const Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(controller: kmContrl, hintText: 'KM'),
                      FormFieldBuild(
                          controller: dlNumberContrl, hintText: 'DL NUMBER'),
                    ],
                  ),
                  const Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(
                          controller: ownerContrl, hintText: 'OWNERSHIP'),
                      FormFieldBuild(
                          controller: priceContrl, hintText: 'PRICE'),
                    ],
                  ),
                  const Gap(7),
                  FormFieldBuild(controller: futureContrl, hintText: 'FUETERS'),
                ],
              ),
              const Gap(30),
              ElevatedButton(
                  onPressed: () {
                    updateAll();
                    Navigator.pop(context);
                  },
                  child: const Text('SUBMIT'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateAll() async {
    final namelx = nameContrl.text;
    final modellx = modelContrl.text;
    final kmlx = kmContrl.text;
    final dlnbrlx = dlNumberContrl.text;
    final ownerlx = ownerContrl.text;
    final pricelx = priceContrl.text;
    final futurelx = futureContrl.text;
    final imagelx = _selectImage!.path;

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
      final update = MediumCarsModel(
          name: namelx,
          model: modellx,
          km: kmlx,
          dlnumber: dlnbrlx,
          owner: ownerlx,
          price: pricelx,
          future: futurelx,
          image: imagelx);
      editCar(DataBases.MediumDb, widget.index, update);
    }
  }

  Future _pickImgGallery() async {
    final returnImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImg == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImg.path);
    });
  }

  _pickImageFromCam() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnImage == null) {
      return;
    }

    setState(() {
      _selectImage = File(returnImage.path);
    });
  }
}
