// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodOrder _$FoodOrderFromJson(Map<String, dynamic> json) => FoodOrder(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      quantity: json['quantity'] as int,
      cookDateTime: DateTime.parse(json['cookDateTime'] as String),
      expireDateTime: DateTime.parse(json['expireDateTime'] as String),
      isTaken: json['isTaken'] as bool? ?? false,
    );

Map<String, dynamic> _$FoodOrderToJson(FoodOrder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
      'cookDateTime': instance.cookDateTime.toIso8601String(),
      'expireDateTime': instance.expireDateTime.toIso8601String(),
      'isTaken': instance.isTaken,
    };
