import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? email;
  final String? password;

  User({
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Register {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? password;
  final String? rePassword;
  final String? otp;

  Register(
      {this.email,
      this.firstName,
      this.lastName,
      this.role,
      this.password,
      this.rePassword,
      this.otp});

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}

@JsonSerializable()
class Otp{
  final String? email;

  Otp({
    this.email,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
  Map<String, dynamic> toJson() => _$OtpToJson(this);
}
