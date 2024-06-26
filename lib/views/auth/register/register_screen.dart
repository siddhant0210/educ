import 'package:e_learningapp/utils/extensions.dart';
import 'package:e_learningapp/view_models/otp_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../routes/route_config.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final Logger logger = Logger();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var confirm_password;
  bool _isSecuredPassword = true;
  bool isEmailValid = false;
  bool isFirstNameValid = false;
  bool isLastNameValid = false;
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OtpViewModel>(
      builder: (BuildContext context, OtpViewModel value, Widget? child) {
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
                            controller: emailController,
                            validator: (value) {
                              if (!value!.isValidEmail) {
                                return ' Valid Email is required';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                isEmailValid = value.isValidEmail;
                              });
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.mail,
                                    color: Color(0xff281537)),
                                suffixIcon: isEmailValid
                                    ? const Icon(Icons.check,
                                        color: Colors.green)
                                    : null,
                                label: const Text(
                                  'E-mail',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB81736)),
                                )),
                          ),
                          TextFormField(
                            controller: firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '  first name is required';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                isFirstNameValid = value.isNotEmpty;
                              });
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person,
                                    color: Color(0xff281537)),
                                suffixIcon: isFirstNameValid
                                    ? const Icon(Icons.check,
                                        color: Colors.green)
                                    : null,
                                label: const Text(
                                  'First Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB81736)),
                                )),
                          ),
                          TextFormField(
                            controller: lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '  last name is required';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                isLastNameValid = value.isNotEmpty;
                              });
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person,
                                    color: Color(0xff281537)),
                                suffixIcon: isLastNameValid
                                    ? const Icon(Icons.check,
                                        color: Colors.green)
                                    : null,
                                label: const Text(
                                  'Last Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB81736)),
                                )),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          roleFormField(),
                          const SizedBox(
                            height: 22,
                          ),
                          TextFormField(
                            controller: passwordController,
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
                            controller: rePasswordController,
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
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Processing Data")),
                                );
                                await value.otp(
                                  emailController.text.trim(),
                                );

                                // Navigate to the next screen if login is successful
                                // ignore: use_build_context_synchronously
                                logger.i("tapped!");
                                if (context.mounted) {
                                  // Navigator.pushReplacementNamed(
                                  //     context, RouteName.otp);
                                  Navigator.pushReplacementNamed(
                                    context,
                                    RouteName.otp,
                                    arguments: {
                                      'email': emailController.text.trim(),
                                      'firstName':
                                          firstNameController.text.trim(),
                                      'lastName':
                                          lastNameController.text.trim(),
                                      'role': roleController.text.trim(),
                                      'password':
                                          passwordController.text.trim(),
                                      'repassword':
                                          rePasswordController.text.trim(),
                                    },
                                  );
                                }
                              }
                              logger.i("submit tapped!");
                            },
                            child: Container(
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
                                  'Register',
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
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.login);
                                  },
                                  child: const Text(
                                    "Already have an account ?,Sign-In",
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
        );
      },
    ));
  }

  FormField<String> roleFormField() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return DropdownButtonFormField<String>(
          value: selectedRole,
          onChanged: (newValue) {
            setState(() {
              selectedRole = newValue;
              roleController.text = newValue ?? '';
            });
            state.didChange(newValue);
          },
          items: ['Student', 'Teacher']
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person),
            label: Text(
              'Role',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xffB81736)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB81736)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a role';
            }
            return null;
          },
        );
      },
    );
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
