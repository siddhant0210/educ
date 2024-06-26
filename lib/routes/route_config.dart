import 'package:e_learningapp/views/auth/login/login_screen.dart';
import 'package:e_learningapp/views/auth/otp/forgot_password_screen.dart';
import 'package:e_learningapp/views/auth/otp/otp_screen.dart';
import 'package:e_learningapp/views/auth/register/register_screen.dart';
import 'package:e_learningapp/views/home/home_screen.dart';
import 'package:e_learningapp/views/pages/home/notification.dart';
import 'package:e_learningapp/views/pages/profile/account/account.dart';
import 'package:e_learningapp/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const splash = "/splash";
  static const login = "/login";
  static const register = "/register";
  static const home = "/home";
  static const otp = "/otp";
  static const forgotPass = "/forgotpass";
  static const account = "/account";
  static const notifications = "/notifications";
}

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
     case RouteName.otp:
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            email: args?['email'] ?? '',
            firstName: args?['firstName'] ?? '',
            lastName: args?['lastName'] ?? '',
            role: args?['role'] ?? '',
            password: args?['password'] ?? '',
            repassword: args?['repassword'] ?? '',
          ),
        );
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.forgotPass:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case RouteName.account:
        return MaterialPageRoute(builder: (context) => const AccountScreen());
      case RouteName.notifications:
        return MaterialPageRoute(builder: (context) => const Notifications());
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
