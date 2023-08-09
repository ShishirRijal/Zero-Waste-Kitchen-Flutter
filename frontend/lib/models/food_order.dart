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

// list of dummy food orders
List<FoodOrder> dummyFoodOrders = [
  FoodOrder(
    id: '1',
    name: 'Pizza',
    description: 'Delicious cheese pizza with tomato sauce.',
    imageUrl: 'https://example.com/pizza.jpg',
    quantity: 2,
    cookDateTime: DateTime(2023, 8, 10, 18, 0),
    expireDateTime: DateTime(2023, 8, 10, 21, 0),
    isTaken: false,
  ),
  FoodOrder(
    id: '2',
    name: 'Burger',
    description: 'Classic beef burger with lettuce and cheese.',
    imageUrl: 'https://example.com/burger.jpg',
    quantity: 1,
    cookDateTime: DateTime(2023, 8, 11, 12, 30),
    expireDateTime: DateTime(2023, 8, 11, 14, 0),
    isTaken: true,
  ),
  FoodOrder(
    id: '3',
    name: 'Pasta',
    description: 'Spaghetti with marinara sauce and meatballs.',
    imageUrl: 'https://example.com/pasta.jpg',
    quantity: 3,
    cookDateTime: DateTime(2023, 8, 10, 19, 0),
    expireDateTime: DateTime(2023, 8, 10, 20, 0),
    isTaken: false,
  ),
  // Add more dummy food orders here...
];
