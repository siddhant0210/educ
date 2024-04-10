import 'package:e_learningapp/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

import '../../../Routes/route_config.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final Logger logger = Logger();
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var confirm_password;
  bool _isSecuredPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
              'Hello\nSign Up!',
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
                        validator: (value) {
                          if (!value!.isValidEmail) {
                            return ' Valid Email is required';
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
                              'E-mail',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffB81736)),
                            )),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '  userid is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xff281537)),
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
                        obscureText: _isSecuredPassword,
                        validator: (value) {
                          confirm_password = value;
                          if (!value!.isValidPassword) {
                            return ' Valid password is required';
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
                      TextFormField(
                        obscureText: _isSecuredPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Re-password is required';
                          } else if (value != confirm_password) {
                            return "Password must be same";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock,
                                color: Color(0xff281537)),
                            suffixIcon: togglePassword(),
                            label: const Text(
                              'Re-enter Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffB81736)),
                            )),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Processing Data")),
                            );
                            Navigator.pushNamed(context, RouteName.otp);
                          }
                          logger.i("Get OTP tapped!");
                        },
                        child: Container(
                          width: 300,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [Color(0xffB81736), Color(0xff281537)],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Get Otp',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Already have an account ?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RouteName.login);
                              },
                              child: const Text(
                                "Sign-In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
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
