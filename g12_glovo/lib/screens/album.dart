import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de rutas de imágenes
    final List<String> imagePaths = [
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/dominos.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/goiko.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/mcdo.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
      'assets/images/locked.png',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Els meus restaurants',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/gradientyellow.jpg'), // Ruta de tu imagen
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: Text(
                    'ÀLBUM',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Número de columnas
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: imagePaths.length, // Número total de fotos
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              imagePaths[index]), // Ruta de tus imágenes
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
