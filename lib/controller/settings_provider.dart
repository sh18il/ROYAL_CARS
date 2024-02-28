import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'package:royalcars/view/about.dart';
import 'package:royalcars/view/privacypolicy.dart';
import 'package:royalcars/view/widgets/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isLoggedIn = true;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> signOut() async {
    final SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setBool('SAVE_KEY', false);

    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> resetData() async {
    final carsDB = await Hive.openBox<CarsModel>('luxury_cars_db');
    carsDB.clear();
    final carsDBl = await Hive.openBox<LowCarsModel>('low_cars_db');
    carsDBl.clear();
    final carsDBm = await Hive.openBox<MediumCarsModel>('medium_cars_db');
    carsDBm.clear();
  }

  void handleListItemTap(
      BuildContext context, int index, SettingsProvider settingsState) {
    switch (index) {
      case 0:
        settingsState.signOut();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  RegisterScreen()),
          (route) => false,
        );
        break;
      case 1:
        _showResetConfirmationDialog(context, settingsState);
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AboutScreen()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PrivacyScreen()));
        break;
    }
  }

  void _showResetConfirmationDialog(
      BuildContext context, SettingsProvider settingsState) {
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
                settingsState.resetData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
