import 'package:dio/dio.dart';
import 'package:e_learningapp/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService =
    ApiService(Dio()..interceptors.add(LogInterceptor()));
    final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  bool _isloading = false;
  bool _isLogged = false;
  String? error;
  String? _username;
  String? _password;
  String? get username => _username;
  String? get password => _password;
  bool get isLoading => _isloading;
  bool get isLogged => _isLogged;

  set _error(String error) {}
  Future<void> login(String email, String password) async {
    try {
      _isloading = true;
      notifyListeners();

      final loginData = {'username': email, 'password': password};
      await _apiService.login(loginData);
      // logic of login

      // Save user data in SharedPreferences
      await _secureStorage.write(key: 'username', value: email);
      await _secureStorage.write(key: 'password', value: password);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('isLogged', true);

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

  Future<void> retrieveUserData() async {
    _username = await _secureStorage.read(key: 'username');
    _password = await _secureStorage.read(key: 'password');
    notifyListeners();
  }
}
