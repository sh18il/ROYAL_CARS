import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/add_car_provider.dart';
import 'package:royalcars/controller/cred_provider.dart';
import 'package:royalcars/controller/low_controller/edit_low_provider.dart';
import 'package:royalcars/controller/low_controller/search_provider.dart';
import 'package:royalcars/controller/luxury_controller/edit_luxury_provider.dart';
import 'package:royalcars/controller/luxury_controller/searchprovider.dart';
import 'package:royalcars/controller/medium_controller/edit_medium_provider.dart';
import 'package:royalcars/controller/medium_controller/search_provider.dart';
import 'package:royalcars/controller/settings_provider.dart';
import 'package:royalcars/model/luxurycar/cars_model.dart';
import 'package:royalcars/model/lowcar/low_cars_model.dart';
import 'package:royalcars/model/mediumcar/medium_cars_model.dart';
import 'package:royalcars/view/widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CarsModelAdapter().typeId)) {
    Hive.registerAdapter(CarsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(MediumCarsModelAdapter().typeId)) {
    Hive.registerAdapter(MediumCarsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(LowCarsModelAdapter().typeId)) {
    Hive.registerAdapter(LowCarsModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LuxuryCarsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CredProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddCarProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => EditLuxuryProvider(),
        ), ChangeNotifierProvider(
          create: (context) => mediumCarsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LowCarsProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MediumLuxuryProvider(),
        ),
          ChangeNotifierProvider(
          create: (context) => EditLowProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.fallback(),
        home: const SplashScreen(),
      ),
    );
  }
}
