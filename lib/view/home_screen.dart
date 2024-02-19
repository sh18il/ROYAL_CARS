import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:royalcars/view/low_cars_pages/low_cars.dart';
import 'package:royalcars/view/luxuryscreen/luxury_cars_pages.dart';
import 'package:royalcars/view/medium_budjet_screen/medium_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('CARS GAREGE')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LuxurycarsScreen()));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.yellow, Colors.cyan]),
                          width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 190, child: Image.asset('image/rolss.png')),
                      const Text(
                        'LUXURY CARS',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Midiumcars()));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.yellow,
                            Colors.green
                          ]),
                          width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 190, child: Image.asset('image/3jvscb.webp')),
                      const Text(
                        'MEDIUM BUDGET',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LowCars()));
                },
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Colors.red,
                          Colors.yellow,
                          Colors.blueAccent
                        ]),
                        width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 190, child: Image.asset('image/hudai.png')),
                      const Text(
                        'low BUDGET',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
