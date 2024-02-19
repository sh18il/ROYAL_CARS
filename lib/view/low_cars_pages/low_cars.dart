import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';

import 'package:royalcars/view/low_cars_pages/edit_low_cars.dart';
import 'package:royalcars/view/low_cars_pages/view_low_cars.dart';
import '../../service/function.dart';
import '../add_screen.dart';

class LowCars extends StatefulWidget {
  const LowCars({super.key});

  @override
  State<LowCars> createState() => _LowCarsState();
}

class _LowCarsState extends State<LowCars> {
  @override
  void initState() {
    super.initState();
    searchListUpdate();
  }

  String search = "";
  List<LowCarsModel> searchedList = [];
  void searchListUpdate() {
    getAllCars(DataBases.LowDb);
    searchedList = carsLowListNotifier.value
        .where(
          (LowCarsModel) =>
              LowCarsModel.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  search = value;
                  searchListUpdate();
                });
              },
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search here.. LoW cars',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: carsLowListNotifier,
              builder: (BuildContext ctx, List<LowCarsModel> carLLIst,
                  Widget? child) {
                return search.isNotEmpty
                    ? searchedList.isEmpty
                        ? ListView(
                            children: [
                              Center(
                                child: Lottie.asset(
                                    'assets/Animation - 1707811402766.json'),
                              ),
                            ],
                          )
                        : LowCars_Build(searchedList)
                    : LowCars_Build(carLLIst);
              },
            ),
          ),
          Text(
            'Total Low Cars Found: ${carsLowListNotifier.value.length}',
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LowCars_Build(List<LowCarsModel> carsList) {
    return carsList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset('assets/Animation - 1707811402766.json'),
              ),
            ],
          )
        : ListView.separated(
            itemCount: carsList.length,
            itemBuilder: (context, index) {
              LowCarsModel car = carsList[index];
              sumOfLow.add(int.tryParse(car.price)!.toInt());
              double totalLo = sumOfLow
                  .reduce((value, element) => value + element)
                  .toDouble();
              Chartfucntion.totalLow = totalLo;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewLowCars(
                              name: car.name,
                              model: car.model,
                              km: car.km,
                              index: index,
                              dlnbr: car.dlnumber,
                              owner: car.owner,
                              price: car.price,
                              future: car.future,
                              imagepath: car.image,
                            )));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(30)),
                                color: Color.fromARGB(255, 224, 149, 144),
                              ),
                              width: 30,
                              child: const Column(
                                children: [
                                  Text('R'),
                                  Text('o'),
                                  Text('Y'),
                                  Text('A'),
                                  Text('L'),
                                ],
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 213, 201, 201),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: car.image != null
                                      ? FileImage(File(car.image!))
                                      : const AssetImage("image/carr1.png")
                                          as ImageProvider,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Confirm Deletion'),
                                          content: const Text(
                                              'Are you sure you want to delete this car?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deleteCar(
                                                    DataBases.LowDb, index);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditLowCarScreen(
                                                    name: car.name,
                                                    model: car.model,
                                                    km: car.km,
                                                    index: index,
                                                    dlnbr: car.dlnumber,
                                                    owner: car.owner,
                                                    price: car.price,
                                                    future: car.future,
                                                    imagepath: car.image ?? "",
                                                  )));
                                    },
                                    icon: const Icon(Icons.edit_document)),
                              ],
                            )
                          ],
                        ),
                        const Gap(20),
                        Text(car.name),
                        const Gap(20),
                        Text(car.dlnumber),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: Colors.white,
                ),
              );
            },
          );
  }

  List<int> sumOfLow = [];
}
