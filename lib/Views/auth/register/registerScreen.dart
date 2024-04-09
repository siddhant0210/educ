import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
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
                    const TextField(
                      decoration: InputDecoration(
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
                    const TextField(
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.lock, color: Color(0xff281537)),
                          suffixIcon: Icon(Icons.visibility_off,
                              color: Color(0xff281537)),
                          label: Text(
                            'Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736)),
                          )),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.lock, color: Color(0xff281537)),
                          suffixIcon: Icon(Icons.visibility_off,
                              color: Color(0xff281537)),
                          label: Text(
                            'Re-enter Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB81736)),
                          )),
                    ),
                    
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
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
                    const SizedBox(
                      height: 150,
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Sign-In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17,
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
        )
      ],
    ));
  }
}
