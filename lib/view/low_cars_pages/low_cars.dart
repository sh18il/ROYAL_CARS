import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/controller/cred_provider.dart';
import 'package:royalcars/controller/low_controller/search_provider.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';

import 'package:royalcars/view/low_cars_pages/edit_low_cars.dart';
import 'package:royalcars/view/low_cars_pages/view_low_cars.dart';
import '../../service/function.dart';
import 'package:slideable/slideable.dart';

// ignore: must_be_immutable
class LowCars extends StatelessWidget {
  LowCars({super.key});

  @override
  Widget build(BuildContext context) {
    log('llow');
    Provider.value(value: getAllCars(DataBases.LowDb));
    final provider = Provider.of<LowCarsProvider>(context, listen: false);
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
                provider.updateSearchedList(value);
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
          IconButton(
              onPressed: () {
                Provider.of<LowCarsProvider>(context, listen: false)
                    .updateSearchedList(''); // Refresh
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                Consumer<LowCarsProvider>(builder: (context, provider, child) {
              final carLLIst = carsLowListNotifier;
              final searchedList = provider.searchedList;
              return provider.search.isNotEmpty
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
            }),
          ),
          Consumer<LowCarsProvider>(builder: (context, provider, child) {
            return Text(
              'Total Low Cars Found: ${provider.searchedList.length}',
            );
          }),
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
                child: Slideable(
                  items: <ActionItems>[
                    ActionItems(
                      icon: const Icon(
                        Icons.edit_note,
                        color: Colors.blue,
                      ),
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditLowCarScreen(
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
                      backgroudColor: Colors.transparent,
                    ),
                    ActionItems(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPress: () {
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
                                Consumer<CredProvider>(
                                    builder: (context, value, child) {
                                  return TextButton(
                                    onPressed: () {
                                      value.deletFunction(
                                          DataBases.LowDb, index);
                                      Provider.of<LowCarsProvider>(context,
                                              listen: false)
                                          .updateSearchedList(''); //

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Delete'),
                                  );
                                }),
                              ],
                            );
                          },
                        );
                      },
                      backgroudColor: Colors.transparent,
                    ),
                  ],
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
                                  color:
                                      const Color.fromARGB(255, 213, 201, 201),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: car.image != null
                                        ? FileImage(File(car.image!))
                                        : const AssetImage("image/carr1.png")
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                              const Column(
                                children: [Icon(Icons.arrow_forward_ios)],
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
