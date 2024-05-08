import 'package:dio/dio.dart';
import 'package:e_learningapp/services/api_services.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final ApiService _apiService =
      ApiService(Dio()..interceptors.add(LogInterceptor()));
  bool _isloading = false;
  bool _isregistered = false;
  String? error;
  bool get isLoading => _isloading;
  bool get isRegistered => _isregistered;

  set _error(String error) {}

  Future<void> register(String email, String firstName,String lastName,String role, String password) async {
    try {
      _isloading = true;
      notifyListeners();

      final registerData = {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'accountType': role,
        'password': password
      };
      await _apiService.register(registerData);

      // Update login status
      _isregistered = true;

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
