import 'package:flutter/material.dart';

class SearchBarClass extends StatefulWidget {
  const SearchBarClass({super.key, required this.onQueryChanged});

  final void Function(String query) onQueryChanged;

  @override
  State<SearchBarClass> createState() => _SearchBarClassState();
}

class _SearchBarClassState extends State<SearchBarClass> {
  String query = '';

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
    widget.onQueryChanged(newQuery); // Notify the parent widget about the query change
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: onQueryChanged,
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}