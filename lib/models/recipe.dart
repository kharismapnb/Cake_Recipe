class Recipe {
  final String title;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
  });
}
