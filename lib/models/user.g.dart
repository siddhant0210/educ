// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'otp': instance.otp,
    };

Otp _$OtpFromJson(Map<String, dynamic> json) => Otp(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$OtpToJson(Otp instance) => <String, dynamic>{
      'email': instance.email,
    };
