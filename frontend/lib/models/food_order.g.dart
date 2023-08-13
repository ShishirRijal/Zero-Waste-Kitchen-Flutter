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
      type: $enumDecode(_$FoodTypeEnumMap, json['type']),
      isTaken: json['isTaken'] as bool? ?? false,
      acceptedDateTime: json['acceptedDateTime'] == null
          ? null
          : DateTime.parse(json['acceptedDateTime'] as String),
    );

Map<String, dynamic> _$FoodOrderToJson(FoodOrder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'type': _$FoodTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'cookDateTime': instance.cookDateTime.toIso8601String(),
      'expireDateTime': instance.expireDateTime.toIso8601String(),
      'isTaken': instance.isTaken,
      'acceptedDateTime': instance.acceptedDateTime?.toIso8601String(),
    };

const _$FoodTypeEnumMap = {
  FoodType.veg: 'veg',
  FoodType.nonVeg: 'nonVeg',
};
