import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(recipe.title, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(recipe.imageUrl),
              const SizedBox(height: 10),
              Text(
                recipe.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Bahan-bahan:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              for (var ingredient in recipe.ingredients) Text('- $ingredient'),
              const SizedBox(height: 10),
              const Text('Langkah-langkah:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              for (var step in recipe.steps) Text('- $step'),
            ],
          ),
        ),
      ),
    );
  }
}
