import 'package:flutter/material.dart';
import 'login_page.dart';
import '../widgets/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.username});
  final String username;

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
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
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
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Profil Pengguna",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileCard('Username', username),
            _buildProfileCard('Nama', 'Kharisma Putri Nur Baiti'),
            _buildProfileCard('NIM', '124220063'),
            _buildProfileCard('Hobi', 'Scroll Tiktok'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, username: username),
    );
  }

  Widget _buildProfileCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              '$label: ',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 18, color: Colors.pinkAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
