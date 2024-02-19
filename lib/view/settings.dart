import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';

import 'package:royalcars/view/widgets/register.dart';

import 'about.dart';
import 'privacypolicy.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> itemNames = [
    'LOGOUT',
    'RESET',
    'ABOUT',
    'PRIVACY & POLICY',
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          const Column(
            children: [
              Gap(50),
              Text(
                'SETTINGS',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Gap(50),
          Expanded(
            child: ListView.builder(
              itemCount: itemNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(40),
                      Text(itemNames[index]),
                    ],
                  ),
                  onTap: () {
                    _handleListItemTap(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleListItemTap(int index) {
    switch (index) {
      case 0:
        singout(context);
        break;

      case 1:
        _showResetConfirmationDialog();
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AboutScreen()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PrivacyScreen()));
        break;
    }
  }

  void singout(context) async {
    final _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setBool(SAVE_KEY, false);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
        (route) => false);
  }

  void _showResetConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Reset"),
          content: const Text("Are you sure you want to reset all data?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Reset"),
              onPressed: () {
                _resetData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetData() async {
    final carslDB = await Hive.openBox<CarsModel>('luxury_cars_db');
    carslDB.clear();
    final carslDBl = await Hive.openBox<LowCarsModel>('low_cars_db');
    carslDBl.clear();
    final carslDBm = await Hive.openBox<MediumCarsModel>('medium_cars_db');
    carslDBm.clear();
  }
}
