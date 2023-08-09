import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    this.email,
    this.name,
    this.isDonor,
  });

  final String? email;
  final String id;
  final String? name;
  final bool? isDonor;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  // to json
  Map<String, dynamic> toJson() => _$UserToJson(this);
  // from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
