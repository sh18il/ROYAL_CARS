import 'package:hive_flutter/hive_flutter.dart';

part 'low_cars_model.g.dart';

@HiveType(typeId: 3)
class LowCarsModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String model;
  @HiveField(3)
  final String km;
  @HiveField(4)
  final String dlnumber;
  @HiveField(5)
  final String owner;
  @HiveField(6)
  final String price;
  @HiveField(7)
  final String future;
  @HiveField(8)
  final String? image;

  LowCarsModel(
      {required this.name,
      required this.model,
      required this.km,
      required this.dlnumber,
      required this.owner,
      required this.price,
      required this.future,
      this.image});
}
