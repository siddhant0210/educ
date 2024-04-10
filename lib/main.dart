import 'package:e_learningapp/routes/route_config.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
///
/// login >> localhost:4000/api/v1/login
/// signup >> localhost:4000/api/v1/signup