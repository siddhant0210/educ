import 'package:e_learningapp/views/auth/login/loginScreen.dart';
import 'package:e_learningapp/views/auth/otp/forgot_password.dart';
import 'package:e_learningapp/views/auth/otp/otpScreen.dart';
import 'package:e_learningapp/views/auth/register/registerScreen.dart';
import 'package:e_learningapp/views/splash/splashScreen.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const splash = "/splash";
  static const login = "/login";
  static const register = "/register";
  static const home = "/home";
  static const otp = "/otp";
  static const forgotPass = "/forgotpass";
}

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case RouteName.otp:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case RouteName.forgotPass:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());     
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Unknown Route"),
            ),
          ),
          settings: settings,
        );
    }
  }
}