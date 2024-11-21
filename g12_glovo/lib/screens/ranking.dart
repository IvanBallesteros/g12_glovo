import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Ranking',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 112, 95, 212),
      ),
      body: Column(
        children: [
          Container(
            height:
                MediaQuery.of(context).size.height * 0.25, // 35% de la altura
            color: const Color.fromARGB(
                255, 112, 95, 212), // Mismo color que AppBar
            child: const Center(
              child: Text(
                'Ranking for December',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ),
          Expanded(
            // Resto de la pantalla
            child: Container(
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Ranking (widget)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
