import 'package:e_learningapp/models/course.dart';
import 'package:e_learningapp/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';

class Coursecard extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const Coursecard({required this.homeViewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: homeViewModel.fetchData(),
      builder: (context, AsyncSnapshot<List<Course>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          return SingleChildScrollView( // Wrap Row with SingleChildScrollView
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCourseList(snapshot.data ?? []),
            ),
          );
        }
      },
    );
  }

  List<Widget> _buildCourseList(List<Course> courses) {
    return courses.map((item) {
      return SizedBox(
        width: 150,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70, // Consider removing fixed height if needed
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain, // Use BoxFit.contain or other flexible fit
                    image: NetworkImage(item.thumbnail ?? ''),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.courseName ?? 'No Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Instructor: ${item.instructor?.firstName} ${item.instructor?.lastName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Price: \$${item.price ?? 0}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}