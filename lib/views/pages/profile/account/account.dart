import 'package:e_learningapp/constants/custom_form.dart';
import 'package:e_learningapp/routes/route_config.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Account Settings",
            style: TextStyle(
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
          children: <Widget>[
            ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 20),
                ),
                leading: const Icon(Icons.lock),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomFormWidget(
                              appbarName: 'Change Password',
                              hintText1: 'old password',
                              hintText2: 'new password')));
                }),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: const Text(
                  "Change Email",
                  style: TextStyle(fontSize: 20),
                ),
                leading: const Icon(Icons.email),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomFormWidget(
                              appbarName: 'Change Email Address',
                              hintText1: 'old email',
                              hintText2: 'new email')));
                }),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: const Text(
                  "Change Username",
                  style: TextStyle(fontSize: 20),
                ),
                leading: const Icon(Icons.person_3),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomFormWidget(
                              appbarName: 'Change username',
                              hintText1: 'old username',
                              hintText2: 'new username')));
                }),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: const Text(
                  "Add another account",
                  style: TextStyle(fontSize: 20),
                ),
                leading: const Icon(Icons.account_box_outlined),
                onTap: () {
                  Navigator.pushNamed(context, RouteName.login);
                }),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: const Text(
                  "Delete your account",
                  style: TextStyle(fontSize: 20),
                ),
                leading: const Icon(Icons.delete),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  CustomFormWidget(
                                appbarName: 'Delete Account',
                                hintText1: 'username',
                                hintText2: 'password',
                                titleDialog: 'Confirmation',
                                contentDialog:
                                    'Are you sure you want to delete account',
                                actionsDialog: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Delete'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              )));
                }),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
          ],
        ));
  }
}
