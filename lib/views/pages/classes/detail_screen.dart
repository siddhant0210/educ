import 'package:e_learningapp/models/search.dart';
import 'package:flutter/material.dart';

class SearchDetailScreen extends StatelessWidget {
  final Search pokemon;
  const SearchDetailScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [    
                  // Load image from network
                  FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder_image.png', // Placeholder image
                  image: pokemon.image_url ?? '', // Image URL
                  fit: BoxFit.cover,
                  width: 550, // Increased width
                  height: 550, // Increased height
                ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Name: ${pokemon.pokemon ?? ''}'),
            Text('Type: ${pokemon.type ?? ''}'),
            Text('Abilities: ${pokemon.abilities ?? ''}'),
            Text('Hitpoints: ${pokemon.hitpoints ?? ''}'),
            Text('Evolution: ${pokemon.evolutions ?? ''}'),
            Text('Location: ${pokemon.location ?? ''}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}