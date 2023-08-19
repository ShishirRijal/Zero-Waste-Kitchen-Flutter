import 'package:json_annotation/json_annotation.dart';

part 'food_order.g.dart';

enum FoodType { veg, nonVeg }

@JsonSerializable()
class FoodOrder {
  String id;
  String userId;
  String name;
  String description;
  String imageUrl;
  FoodType type;
  int quantity; // inperson
  DateTime cookDateTime;
  DateTime expireDateTime;
  bool isTaken;
  DateTime? acceptedDateTime;
  String location;
  String? partnerId;

  // name constructor
  FoodOrder({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.cookDateTime,
    required this.expireDateTime,
    required this.type,
    this.isTaken = false,
    this.acceptedDateTime,
    this.location = 'unknown',
  });

  // to json
  Map<String, dynamic> toJson() => _$FoodOrderToJson(this);
  // from json
  factory FoodOrder.fromJson(Map<String, dynamic> json) =>
      _$FoodOrderFromJson(json);
}



//* list of dummy food orders
// List<FoodOrder> dummyFoodOrders = [
//   FoodOrder(
//     id: '1',
//     name: 'Pizza',
//     description: 'Delicious cheese pizza with tomato sauce.',
//     imageUrl:
//         "https://static.thehoneycombers.com/wp-content/uploads/sites/2/2018/10/Shake-Farm.jpg",
//     quantity: 2,
//     cookDateTime: DateTime(2023, 8, 10, 18, 0),
//     expireDateTime: DateTime(2023, 8, 10, 21, 0),
//     isTaken: false,
//     type: FoodType.nonVeg,
//   ),
//   FoodOrder(
//     id: '2',
//     name: 'Burger',
//     description: 'Classic beef burger with lettuce and cheese.',
//     imageUrl: 'https://images.deliveryhero.io/image/fd-th/LH/u3ch-hero.jpg',
//     quantity: 1,
//     cookDateTime: DateTime(2023, 8, 11, 12, 30),
//     expireDateTime: DateTime(2023, 8, 11, 14, 0),
//     type: FoodType.nonVeg,
//     isTaken: true,
//   ),
//   FoodOrder(
//     id: '3',
//     name: 'Pasta',
//     description: 'Spaghetti with marinara sauce and meatballs.',
//     imageUrl:
//         'https://www.indiafoodnetwork.in/wp-content/uploads/2019/03/curry-recipes.jpg',
//     quantity: 3,
//     cookDateTime: DateTime(2023, 8, 10, 19, 0),
//     expireDateTime: DateTime(2023, 8, 10, 20, 0),
//     type: FoodType.veg,
//     isTaken: false,
//   ),
//   // Add more dummy food orders here...
// ];
