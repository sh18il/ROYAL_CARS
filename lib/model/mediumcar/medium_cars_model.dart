
import 'package:hive/hive.dart';
 part 'medium_cars_model.g.dart';

@HiveType(typeId: 2)
class MediumCarsModel {
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

  MediumCarsModel( {
    required this.name,
    required this.model,
    required this.km,
    required this.dlnumber,
    required this.owner,
    required this.price,
    required this.future,
    this.image
  });
}