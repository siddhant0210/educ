import 'package:e_learningapp/routes/route_config.dart';
import 'package:e_learningapp/view_models/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String password;
  final String repassword;

   const OtpScreen({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.password,
    required this.repassword,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();
  final Logger logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<RegisterViewModel>(
      builder: (BuildContext context, RegisterViewModel value, Widget? child) {
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
                  'OTP sent\nsuccessfully',
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
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'We have sent the OTP\nto your email address. Resend?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Form(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: pinController,
                                  
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  onSaved: (pin1) {},
                                  decoration:
                                      const InputDecoration(hintText: "0"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: pinController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  onSaved: (pin2) {},
                                  decoration:
                                      const InputDecoration(hintText: "0"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: pinController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  onSaved: (pin3) {},
                                  decoration:
                                      const InputDecoration(hintText: "0"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: pinController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  onSaved: (pin4) {},
                                  decoration:
                                      const InputDecoration(hintText: "0"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: pinController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  onSaved: (pin1) {},
                                  decoration:
                                      const InputDecoration(hintText: "0"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: pinController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  onSaved: (pin1) {},
                                  decoration:
                                      const InputDecoration(hintText: "0"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: GestureDetector(
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
                          await value.register(
                            widget.email,
                            widget.firstName,
                            widget.lastName,
                            widget.password,
                            widget.repassword,
                            widget.role,
                            pinController.text.trim(),
                          );

                          if (value.isRegistered) {
                            // Navigate to the next screen if login is successful
                            // ignore: use_build_context_synchronously
                            logger.i("tapped!");
                            if (context.mounted) {
                              // Navigator.pushReplacementNamed(
                              //     context, RouteName.otp);
                              Navigator.pushReplacementNamed(
                                context,
                                RouteName.login,
                              );
                            }
                          }
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
                              'Submit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
