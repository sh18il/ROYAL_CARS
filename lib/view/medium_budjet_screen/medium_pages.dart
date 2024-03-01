import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/controller/cred_provider.dart';
import 'package:royalcars/controller/medium_controller/search_provider.dart';
import 'package:royalcars/service/function.dart';

import 'package:royalcars/view/medium_budjet_screen/medium_edit.dart';
import 'package:royalcars/view/medium_budjet_screen/view_medium_screen.dart';
import '../../model/mediumcar/medium_cars_model.dart';
import 'package:slideable/slideable.dart';

// ignore: must_be_immutable
class Midiumcars extends StatelessWidget {
  Midiumcars({super.key});

  @override
  Widget build(BuildContext context) {
    log('medium');
    Provider.value(value: getAllCars(DataBases.MediumDb));
    final provider = Provider.of<MediumCarsProvider>(context, listen: false);
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
                  hintText: 'Search here Medium cars',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<MediumCarsProvider>(context, listen: false)
                    .updateSearchedList(''); // Refresh the search list
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MediumCarsProvider>(
                builder: (context, provider, child) {
              final searchedListm = provider.searchedList;
              final carLLIst = carsMediumListNotifier;
              return provider.search.isNotEmpty
                  ? searchedListm.isEmpty
                      ? ListView(
                          children: [
                            Lottie.asset(
                                'assets/Animation - 1707811402766.json'),
                          ],
                        )
                      : buildCArList(searchedListm)
                  : buildCArList(carLLIst);
            }),
          ),
          Consumer<MediumCarsProvider>(builder: (context, provider, child) {
            return Text(
              'Total Medium Cars Found: ${provider.searchedList.length}',
            );
          }),
        ],
      ),
    );
  }

  Widget buildCArList(List<MediumCarsModel> carsList) {
    return carsList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset('assets/Animation - 1707811402766.json'),
              )
            ],
          )
        : ListView.separated(
            itemCount: carsList.length,
            itemBuilder: (context, index) {
              MediumCarsModel car = carsList[index];
              sumofMedium.add(int.tryParse(car.price)!.toInt());
              double totalmedium = sumofMedium
                  .reduce((value, element) => value + element)
                  .toDouble();
              Chartfucntion.totalMedi = totalmedium;
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
                            builder: (context) => MediumEditScreen(
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
                                          DataBases.MediumDb, index);
                                      Provider.of<MediumCarsProvider>(context,
                                              listen: false)
                                          .updateSearchedList('');

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
                          builder: (context) => MediumViewScreen(
                              name: car.name,
                              model: car.model,
                              km: car.km,
                              index: index,
                              dlnbr: car.dlnumber,
                              owner: car.owner,
                              price: car.price,
                              future: car.future,
                              imagepath: car.image)));
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
                                children: [
                                  Gap(30),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              )
                            ],
                          ),
                          Text(car.name),
                          const Gap(20),
                          Text(car.dlnumber),
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

  List<int> sumofMedium = [];
}
