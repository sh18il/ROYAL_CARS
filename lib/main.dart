import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(),
      home: const SplashScreen(),
    );
  }
}
