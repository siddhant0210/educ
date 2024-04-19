import 'package:e_learningapp/constants/custom_dialog.dart';
import 'package:flutter/material.dart';

class CustomFormWidget extends StatelessWidget {
  final String appbarName;
  final String hintText1;
  final String hintText2;
  final String? titleDialog;
  final String? contentDialog;
  final List<TextButton>? actionsDialog;

  const CustomFormWidget({
    required this.appbarName,
    required this.hintText1,
    required this.hintText2,
    this.titleDialog,
    this.contentDialog,
    this.actionsDialog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController1 = TextEditingController();
    TextEditingController textFieldController2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarName,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 100, 25, 40),
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Enter $hintText1:",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: textFieldController1,
                  decoration: InputDecoration(
                    hintText: hintText1,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Enter $hintText2:",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: textFieldController2,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: hintText2,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (titleDialog != null &&
                          contentDialog != null &&
                          actionsDialog != null) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: titleDialog!,
                            content: contentDialog!,
                            actions: actionsDialog!,
                          ),
                        );
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
