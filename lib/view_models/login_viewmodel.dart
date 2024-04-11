import 'package:dio/dio.dart';
import 'package:e_learningapp/services/api_services.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService =
      ApiService(Dio()..interceptors.add(LogInterceptor()));
  bool _isloading = false;
  bool _isLogged = false;
  String? error;
  bool get isLoading => _isloading;
  bool get isLogged => _isLogged;

  set _error(String error) {}
  Future<void> login(String email, String password) async {
    try {
      _isloading = true;
      notifyListeners();

      final loginData = {'username': email, 'password': password};
      final user = await _apiService.login(loginData);
      // logic of login

      // Save user data in SharedPreferences

      // Update login status
      _isLogged = true;

      // Handle other logic for successful login, e.g., navigation
      // Example: navigateToHomeScreen();

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
