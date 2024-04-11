import 'package:dio/dio.dart';
import 'package:e_learningapp/Services/api_services.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService(Dio());
  bool _isloading = false;
  String? error;

  Future<void> login(String email, String password) async {
    try {
      _isloading = true;
      notifyListeners();

      final loginData = {'email': email, 'password': password};
      final user = await _apiService.login(loginData);
//
      _isloading = false;
      error = null;
    } catch (e) {
      _isloading = false;
      error = "failed to log in, please try again";
    } finally {
      notifyListeners();
    }
  }
}
