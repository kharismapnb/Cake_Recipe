import 'package:flutter/material.dart';
import 'login_page.dart';
import '../models/recipe.dart';
import '../widgets/bottom_navbar.dart';
import 'recipe_detail_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [
    Recipe(
      title: 'Chocolate Cake',
      imageUrl: 'assets/images/chocolate.png',
      description:
          'Manjakan diri dengan kelembutan moist chocolate cake yang lumer di mulut, sempurna untuk momen manis setiap hari!',
      ingredients: ['150g Tepung', '200g Gula', '100g Coklat Bubuk'],
      steps: ['Campur bahan', 'Panggang 180°C selama 20 menit'],
    ),
    Recipe(
      title: 'Cheesecake',
      imageUrl: 'assets/images/cheesecake.png',
      description:
          'Cheesecake creamy dan lembut ini menghadirkan rasa yang meleleh di mulut, sempurna untuk memanjakan lidah di setiap kesempatan!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Cookies',
      imageUrl: 'assets/images/cookies.png',
      description:
          'Setiap gigitan cookies ini membawa kebahagiaan yang renyah di luar, lembut di dalam—nikmat yang tak terlewatkan!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Cupcake',
      imageUrl: 'assets/images/cupcake.png',
      description:
          'Rasakan setiap gigitan manis dan lembut dari cupcake yang sempurna, menghiasi hari dengan kejutan rasa yang tak terlupakan!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Pancake',
      imageUrl: 'assets/images/pancake.png',
      description:
          'Mulai hari dengan kelembutan sempurna dari pancake yang fluffy dan lezat, manisnya bikin hari lebih cerah!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Redvelvet Cake',
      imageUrl: 'assets/images/redvelvet.png',
      description:
          'Red Velvet Cake yang lembut dan penuh warna, memanjakan lidah dengan keseimbangan rasa manis dan sedikit asam, sempurna untuk setiap momen spesial!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Strawberry Cake',
      imageUrl: 'assets/images/strawberries.png',
      description:
          'Manisnya Strawberry Cake yang lembut dan segar, memberikan kesegaran alami dalam setiap gigitan—cocok untuk menyempurnakan hari-harimu!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
  ];

  List<Recipe> recommendedRecipes = [
    Recipe(
      title: 'Strawberry Cake',
      imageUrl: 'assets/images/strawberries.png',
      description:
          'Manisnya Strawberry Cake yang lembut dan segar, memberikan kesegaran alami dalam setiap gigitan—cocok untuk menyempurnakan hari-harimu!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Cookies',
      imageUrl: 'assets/images/cookies.png',
      description:
          'Setiap gigitan cookies ini membawa kebahagiaan yang renyah di luar, lembut di dalam—nikmat yang tak terlewatkan!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Redvelvet Cake',
      imageUrl: 'assets/images/redvelvet.png',
      description:
          'Red Velvet Cake yang lembut dan penuh warna, memanjakan lidah dengan keseimbangan rasa manis dan sedikit asam, sempurna untuk setiap momen spesial!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
    Recipe(
      title: 'Cheesecake',
      imageUrl: 'assets/images/cheesecake.png',
      description:
          'Cheesecake creamy dan lembut ini menghadirkan rasa yang meleleh di mulut, sempurna untuk memanjakan lidah di setiap kesempatan!',
      ingredients: ['300g Krim Keju', '100g Biskuit', '150g Gula'],
      steps: ['Campur bahan', 'Dinginkan selama 4 jam di kulkas'],
    ),
  ];

  List<Recipe> filteredRecipes = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredRecipes = recipes;
  }

  void _searchRecipes(String query) {
    final filtered = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      this.query = query;
      filteredRecipes = filtered;
    });
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Home - Resep Kue",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, ${widget.username}!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[300]),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: _searchRecipes,
              decoration: InputDecoration(
                hintText: 'Cari resep...',
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink[300]!),
                ),
                suffixIcon: Icon(Icons.search, color: Colors.pink[300]),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Yang Lagi Viral Nih!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[300]),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recommendedRecipes.map((recipe) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailPage(recipe: recipe),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8.0)),
                              child: Image.asset(
                                recipe.imageUrl,
                                height: 80,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipe.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pinkAccent,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredRecipes.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: ClipOval(
                              child: Image.asset(
                                filteredRecipes[index].imageUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              filteredRecipes[index].title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(filteredRecipes[index].description),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailPage(
                                      recipe: filteredRecipes[index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Hasil tidak ditemukan',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavBar(selectedIndex: 0, username: widget.username),
    );
  }
}
