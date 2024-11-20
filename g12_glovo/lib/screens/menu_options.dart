import 'package:flutter/material.dart';

class MenuOptionsScreen extends StatelessWidget {
  const MenuOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 233, 176, 1), // Amarillo más claro
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Colors.black54,
              ),
              SizedBox(width: 12),
              Text(
                'Cercar achievements',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 194, 68, 1),
      ),
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageButton(
                context,
                'assets/buttons/badges.png',
                () {/* Acción para botón 1 */},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImageButton(
                    context,
                    'assets/buttons/album.png',
                    () {/* Acción para botón 2 */},
                  ),
                  const SizedBox(width: 20),
                  _buildImageButton(
                    context,
                    'assets/buttons/ranking.png',
                    () {/* Acción para botón 3 */},
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Achievements',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(
    BuildContext context,
    String imagePath,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
