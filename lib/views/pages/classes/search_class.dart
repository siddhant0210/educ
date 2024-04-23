import 'package:dio/dio.dart';
import 'package:e_learningapp/networking/search.dart';
import 'package:e_learningapp/services/search_service.dart';
import 'package:e_learningapp/views/pages/classes/detail_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Search> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _onTextChanged(_searchController.text.toString()),
              decoration:  InputDecoration(
                hintText: 'Search all courses',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(24),  
                ),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(child: _buildSearchResultsList())
        ],
      ),
    );
  }

  void _onTextChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        _suggestions.clear();
      });
    } else if(value.isNotEmpty) {
      _searchPokemon(value);
    }
  }

  void _searchPokemon(String query) async {
    try {
      final response = await SearchService(Dio()..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))).searchPokemon(query);
      setState(() {
      _suggestions = response.where((pokemon) => pokemon.pokemon!.toLowerCase().contains(query.toLowerCase())).toList();
    });
    } catch (error) {
      // Handle error
      print('Error occurred: $error');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred while fetching data.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildSearchResultsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _suggestions.length,
        itemBuilder: (context, index) {
          final Search pokemon = _suggestions[index];
          
           if (pokemon.image_url != null && pokemon.image_url!.isNotEmpty) {
          // Load image from network
          return ListTile(
            
            leading: Image.network(pokemon.image_url!),
            title: Text(pokemon.pokemon!),
            subtitle: Text('Type: ${pokemon.type} | Hitpoints: ${pokemon.hitpoints}'),
            onTap: () {
              _navigateToPokemonDetails(pokemon.id ?? 0);
            },
          );
        } else {
          // Display alternative content for invalid imageUrl
          return ListTile(
            title: Text(pokemon.pokemon!), // You can show a placeholder image or text here
            subtitle: Text('Type: ${pokemon.type} | Hitpoints: ${pokemon.hitpoints}'),
            onTap: () {
              // Handle onTap
            },
          );
        }
        },
      ),
    );
  }

  Future<void> _navigateToPokemonDetails(int id) async {
    try {
      final pokemon = await SearchService(Dio()).getPokemonDetails(id);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchDetailScreen(pokemon: pokemon),
        ),
      );
    } catch (error) {
      // Handle error
      print('Error occurred while fetching Pokemon details: $error');
    }
  }
}
