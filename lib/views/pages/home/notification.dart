import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(1.0),
          child: Text('Notifications'),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 100, 25, 40),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.check_circle)),
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Change this to the number of notifications you want to display
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:  const Color.fromARGB(255, 100, 25, 40),
              child: Text((index + 1).toString()), // Display notification number
            ),
            title: Text('Notification ${index + 1}'),
            subtitle: const Text('This is a dummy notification.'),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}
