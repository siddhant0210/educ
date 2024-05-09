import 'package:e_learningapp/models/course.dart';
import 'package:e_learningapp/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';

class Coursecard extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const Coursecard({required this.homeViewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // Dynamic height
      child: FutureBuilder<List<Course>>(
        future: homeViewModel.fetchData(),
        builder: (context, AsyncSnapshot<List<Course>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return _buildCourseList(snapshot.data ?? []);
          }
        },
      ),
    );
  }

 Widget _buildCourseList(List<Course> courses) {
    if (courses.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final item = courses[index];
          return Card(
            
            child: SizedBox(
              width: 150,
              child: ListTile(
                title: Text(item.title ?? 'No Title', maxLines: 1,),
                subtitle: Text(item.description ?? 'No Description', maxLines: 3,),
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          "No data found",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    }
  }
}
