import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.imgUrl,
    required this.isDonor,
    this.noOfServices = 0,
  });

  final String email;
  final String id;
  final String name;
  final bool isDonor;
  final String imgUrl;
  final int? noOfServices;

  // to json
  Map<String, dynamic> toJson() => _$UserToJson(this);
  // from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
