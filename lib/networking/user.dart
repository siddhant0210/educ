

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  final String? email;
  final String? password;

  User({
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String , dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Register{
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? password;

  Register({
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.password,
  });

  factory Register.fromJson(Map<String , dynamic> json) => _$RegisterFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}