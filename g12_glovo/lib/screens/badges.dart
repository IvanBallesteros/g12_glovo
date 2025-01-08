import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key});

  @override
  _BadgesScreenState createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final String jsonString =
        await rootBundle.loadString('lib/json/comercios.JSON');
    setState(() {
      _userData = json.decode(jsonString);
    });
  }

  Widget _buildBusinessGrid(String category) {
    if (_userData == null) return const CircularProgressIndicator();

    final businesses = _userData!['Usuaris'][0]['comercios'][category] as List;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: businesses.length,
      itemBuilder: (context, index) {
        final businessName = businesses[index];
        return Container(
          padding: const EdgeInsets.all(4),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/${businessName.replaceAll("'", "")}.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildRestaurantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('Restaurants'),
        _buildBusinessGrid('Restaurants'),
        _buildViewMoreButton(context, 'Restaurants'),
      ],
    );
  }

  Widget _buildSupermercatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('Supermercats'),
        _buildBusinessGrid('Supermercats'),
        _buildViewMoreButton(context, 'Supermercats'),
      ],
    );
  }

  Widget _buildBotiguesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('Botigues'),
        _buildBusinessGrid('Botigues'),
        _buildViewMoreButton(context, 'Botigues'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Badges',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRestaurantsSection(),
                const SizedBox(height: 16),
                const Divider(thickness: 1.5),
                const SizedBox(height: 16),
                _buildSupermercatsSection(),
                const SizedBox(height: 16),
                const Divider(thickness: 1.5),
                const SizedBox(height: 16),
                _buildBotiguesSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildViewMoreButton(BuildContext context, String category) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VeureMesScreen(title: category),
            ),
          );
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Veure més', style: TextStyle(color: Colors.black)),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
