


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/low_controller/edit_low_provider.dart';
import 'package:royalcars/view/widgets/editpage.dart';

// ignore: must_be_immutablemj
class EditLowCarScreen extends StatelessWidget {
  String name;
  String model;
  String km;
  int index;
  String dlnbr;
  String owner;
  String price;
  String future;
  dynamic imagepath;
  EditLowCarScreen({
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
      body: Consumer<EditLowProvider>(builder: (context, provider, child) {
        return SafeArea(
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
                      backgroundImage: provider.selectImage != null
                          ? FileImage(provider.selectImage!)
                          : const AssetImage("image/rolss.png")
                              as ImageProvider,
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
                          provider.pickImgGallery();
                        },
                        icon: const Icon(Icons.image),
                        label: const Text("GALLERY")),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 184, 151, 192)),
                        onPressed: () {
                          provider.pickImageFromCam();
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
                        FormFieldBuild(
                            controller: provider.nameContrl..text = name,
                            hintText: 'NAME'),
                        FormFieldBuild(
                            controller: provider.modelContrl,
                            hintText: 'MODEL'),
                      ],
                    ),
                    const Gap(7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FormFieldBuild(
                            controller: provider.kmContrl..text = km,
                            hintText: 'KM'),
                        FormFieldBuild(
                            controller: provider.dlNumberContrl..text = dlnbr,
                            hintText: 'DL NUMBER'),
                      ],
                    ),
                    const Gap(7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FormFieldBuild(
                            controller: provider.ownerContrl..text = owner,
                            hintText: 'OWNERSHIP'),
                        FormFieldBuild(
                            controller: provider.priceContrl..text = price,
                            hintText: 'PRICE'),
                      ],
                    ),
                    const Gap(7),
                    FormFieldBuild(
                        controller: provider.futureContrl..text = future,
                        hintText: 'FUETERS'),
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
                          index: index);
                      Navigator.pop(context);
                    },
                    child: const Text('SUBMIT'))
              ],
            ),
          ),
        );
      }),
    );
  }
}
