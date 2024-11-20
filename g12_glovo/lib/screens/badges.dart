import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Badges',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
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
              Color.fromRGBO(255, 233, 176, 1),
              Color.fromRGBO(255, 194, 68, 1),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: const Center(
          child: Text('Badges Content'),
        ),
      ),
    );
  }
}
