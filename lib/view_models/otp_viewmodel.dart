import 'package:dio/dio.dart';
import 'package:e_learningapp/services/api_services.dart';
import 'package:flutter/material.dart';

class OtpViewModel extends ChangeNotifier{
  final ApiService _apiService = ApiService(Dio()..interceptors.add(LogInterceptor()));

  Future<void> otp(String email) async {
    try{
      final otpData = {'email': email};
      await _apiService.otp(otpData);  
    } catch(e){
      print('Error fetching data: $e');
      rethrow;
    }
  }
}