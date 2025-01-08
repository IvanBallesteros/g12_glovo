import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<Map<String, dynamic>> achievements = [];

  @override
  void initState() {
    super.initState();
    loadAchievements();
  }

  Future<void> loadAchievements() async {
    final String response = await rootBundle.loadString('lib/json/logro1.json');
    final data = json.decode(response);

    setState(() {
      achievements = [
        ...data['Restaurants'],
        ...data['Supermercats'],
        ...data['Botigues']
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 194, 68, 1),
        title: const Text(
          'Album',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: achievements.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: [
                    Color.fromRGBO(255, 233, 176, 1), // Amarillo más claro
                    Color.fromRGBO(255, 194, 68, 1), // Amarillo actual
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  final achievement = achievements[index];
                  final imagePath = achievement['progression'] == 0
                      ? 'assets/images/logrolocked.png'
                      : 'assets/images/${achievement['nom']}.png';

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(imagePath),
                  );
                },
              ),
            ),
    );
  }
}
