import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class MediumViewScreen extends StatelessWidget {
  String name;
  String model;
  String km;
  int index;
  String dlnbr;
  String owner;
  String price;
  String future;
  dynamic imagepath;
  MediumViewScreen({
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
          child: Text("PROFILE CARS",
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
              const Gap(40),
              Center(
                  child: Image(
                image: FileImage(File(imagepath)),
              )),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                const Text('CarName :'),
                                Text(
                                  name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                const Text('MODEL :'),
                                Text(
                                  model,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                const Text('KM :'),
                                Text(
                                  km,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                const Text('DL NUMBER :'),
                                Text(
                                  dlnbr,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                const Text('OWNER :'),
                                Text(
                                  owner,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      Card(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: Column(
                              children: [
                                const Text('PRICE :'),
                                Text(
                                  price,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Card(
                    child: SizedBox(
                        width: 180,
                        height: 70,
                        child: Column(
                          children: [
                            const Text('FUTURE :'),
                            Text(
                              future,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                  const Gap(30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
