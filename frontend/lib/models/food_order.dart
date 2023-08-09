import 'package:json_annotation/json_annotation.dart';

part 'food_order.g.dart';

enum FoodType { veg, nonVeg }

@JsonSerializable()
class FoodOrder {
  String id;
  String name;
  String description;
  String imageUrl;
  int quantity; // inperson
  DateTime cookDateTime;
  DateTime expireDateTime;
  bool isTaken;

  // name constructor
  FoodOrder({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.cookDateTime,
    required this.expireDateTime,
    this.isTaken = false,
  });

  // to json
  Map<String, dynamic> toJson() => _$FoodOrderToJson(this);
  // from json
  factory FoodOrder.fromJson(Map<String, dynamic> json) =>
      _$FoodOrderFromJson(json);
}
