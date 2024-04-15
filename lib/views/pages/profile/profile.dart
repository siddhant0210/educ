import 'package:e_learningapp/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     body: Column(children: <Widget>[
      ListTile(
        trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
        title: const Text("Account Settings", style: TextStyle(fontSize: 20),),
        leading: const Icon(Icons.person_2_outlined),
        onTap: () {
          Navigator.pushNamed(context, RouteName.account);
        },
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
      const ListTile(
        trailing: Icon(Icons.arrow_forward_ios, size: 16,),
        title: Text("Saved info", style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.bookmark),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
     
      const ListTile(
        trailing: Icon(Icons.arrow_forward_ios, size: 16,),
        title: Text("My purchase", style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.book_rounded),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
      const ListTile(
        trailing: Icon(Icons.arrow_forward_ios, size: 16,),
        title: Text("Refer & Earn", style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.share),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
      const ListTile(
        trailing: Icon(Icons.arrow_forward_ios, size: 16,),
        title: Text("About us", style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.info),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
      const ListTile(
        trailing: Icon(Icons.arrow_forward_ios, size: 16,),
        title: Text("Logout", style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.logout),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
     ],)
    );
  }
}
