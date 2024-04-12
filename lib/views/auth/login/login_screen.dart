import 'package:e_learningapp/utils/extensions.dart';
import 'package:e_learningapp/view_models/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/route_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final Logger logger = Logger();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSecuredPassword = true;

  @override
  void initState() {
    super.initState();
    // Retrieve saved user data when the screen is initialized
    Provider.of<LoginViewModel>(context, listen: false).retrieveUserData();
    checkLoggedInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<LoginViewModel>(
      builder: (BuildContext context, LoginViewModel value, Widget? child) {
        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffB81736), Color(0xff281537)],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Hello\nSign in!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'userid is required';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.mail, color: Color(0xff281537)),
                                suffixIcon: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                label: Text(
                                  'UserId',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB81736)),
                                )),
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isSecuredPassword,
                            validator: (value) {
                              if (!value!.isValidPassword) {
                                return ' Valid Password is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock,
                                    color: Color(0xff281537)),
                                suffixIcon: togglePassword(),
                                label: const Text(
                                  'Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB81736)),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle the onTap action, such as navigating to the forgot password screen
                              Navigator.pushNamed(
                                  context, RouteName.forgotPass);
                            },
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff281537),
                                    fontSize: 17),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (value.isLoading) {
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: CircularProgressIndicator(
                                    color: Color(0xff281537),
                                    backgroundColor: Colors.transparent,
                                  ), // Show circular progress bar below the button
                                );
                              }

                              if (_formKey.currentState!.validate()) {
                                await value.login(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                                if (value.isLogged) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Processing Data")),
                                    );
                                  }
                                  // Navigate to the next screen if login is successful
                                  // ignore: use_build_context_synchronously
                                  logger.i("tapped!");
                                  if (context.mounted) {
                                    Navigator.pushReplacementNamed(
                                        context, RouteName.home);
                                  }
                                } else if (!value.isLogged) {
                                  showDialog(
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Login Error'),
                                        content: const Text(
                                            'Wrong username or password.'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                                logger.i("Sign-Up tapped!");
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 300,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xffB81736),
                                        Color(0xff281537)
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 120,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.register);
                                  },
                                  child: const Text(
                                    "Sign-Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }

  Future<void> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLogged') ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, RouteName.home);
    }
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecuredPassword = !_isSecuredPassword;
        });
      },
      icon: _isSecuredPassword
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: const Color(0xff281537),
    );
  }
}
