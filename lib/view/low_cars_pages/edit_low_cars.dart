import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalcars/service/function.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';

import '../widgets/editpage.dart';
import '../add_screen.dart';

class EditLowCarScreen extends StatefulWidget {
  final String name;
  final String model;
  final String km;
  final int index;
  final String dlnbr;
  final String owner;
  final String price;
  final String future;
  final dynamic imagepath;

  const EditLowCarScreen({
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
  State<EditLowCarScreen> createState() => _EditLowCarScreenState();
}

class _EditLowCarScreenState extends State<EditLowCarScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController kmController = TextEditingController();
  final TextEditingController dlNumberController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController futureController = TextEditingController();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    modelController.text = widget.model;
    kmController.text = widget.km;
    dlNumberController.text = widget.dlnbr;
    ownerController.text = widget.owner;
    priceController.text = widget.price;
    futureController.text = widget.future;
    _selectedImage =
        widget.imagepath.isNotEmpty ? File(widget.imagepath) : null;
  }

  @override
  Widget build(BuildContext context) {
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
              _buildImagePreview(),
              const Gap(20),
              const Text('EDIT CAR PHOTO'),
              _buildImageButtons(),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(
                          controller: nameController, hintText: 'NAME'),
                      FormFieldBuild(
                          controller: modelController, hintText: 'MODEL'),
                    ],
                  ),
                  const Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(controller: kmController, hintText: 'KM'),
                      FormFieldBuild(
                          controller: dlNumberController,
                          hintText: 'DL NUMBER'),
                    ],
                  ),
                  const Gap(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormFieldBuild(
                          controller: ownerController, hintText: 'OWNERSHIP'),
                      FormFieldBuild(
                          controller: priceController, hintText: 'PRICE'),
                    ],
                  ),
                  const Gap(7),
                  FormFieldBuild(
                      controller: futureController, hintText: 'FUETERS'),
                ],
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () {
                  _updateAll();
                  Navigator.pop(context);
                },
                child: const Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 25, 25, 81),
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!)
              : const AssetImage("image/rolss.png") as ImageProvider,
        ),
      ),
    );
  }

  Widget _buildImageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 161, 133, 168),
          ),
          onPressed: _pickImgGallery,
          icon: const Icon(Icons.image),
          label: const Text("GALLERY"),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 184, 151, 192),
          ),
          onPressed: _pickImageFromCam,
          icon: const Icon(Icons.camera_alt),
          label: const Text("CAMERA"),
        ),
      ],
    );
  }

  void _updateAll() {
    final name = nameController.text;
    final model = modelController.text;
    final km = kmController.text;
    final dlNumber = dlNumberController.text;
    final owner = ownerController.text;
    final price = priceController.text;
    final future = futureController.text;
    final image = _selectedImage!.path;

    if (name.isEmpty ||
        model.isEmpty ||
        km.isEmpty ||
        dlNumber.isEmpty ||
        owner.isEmpty ||
        price.isEmpty ||
        future.isEmpty ||
        image.isEmpty) {
      return;
    } else {
      final update = LowCarsModel(
        name: name,
        model: model,
        km: km,
        dlnumber: dlNumber,
        owner: owner,
        price: price,
        future: future,
        image: image,
      );

      editCar(DataBases.LowDb, widget.index, update);
    }
  }

  Future<void> _pickImgGallery() async {
    final returnImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImg == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnImg.path);
    });
  }

  Future<void> _pickImageFromCam() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }
}
