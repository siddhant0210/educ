import 'package:e_learningapp/routes/route_config.dart';
import 'package:e_learningapp/views/pages/classes/search_class.dart';
import 'package:e_learningapp/views/pages/home/home.dart';
import 'package:e_learningapp/views/pages/profile/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int selectedtab = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const SearchScreen(),
     const Text(
      'Index 2: Progress',
      style: optionStyle,
    ),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedtab = index;
    });
  }

  getAppBar() {
    switch (selectedtab) {
      case 0:
        {
          return 'Home';
        }
      case 1:
        {
          return 'Courses';
        }
      case 2:
        {
          return 'Your Progress';
        }
      case 3:
        {
          return 'Profile';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(getAppBar()),
        ),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 100, 25, 40),
        actions: [
          IconButton(
              onPressed: () => {
                Navigator.pushNamed(context, RouteName.notifications),
              }, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.check_circle)),
        ],
      ),
      body: widgetOptions.elementAt(selectedtab),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 20),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff281537), Color(0xffB81736)],
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(
              255, 100, 25, 40), // Make the BottomNavigationBar transparent
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xffB81736),
          currentIndex: selectedtab,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.reviews_outlined),
              label: 'Classes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_rounded),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

