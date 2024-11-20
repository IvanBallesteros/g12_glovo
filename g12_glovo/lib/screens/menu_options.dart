import 'package:flutter/material.dart';
import 'package:g12_glovo/screens/screens.dart';

class MenuOptionsScreen extends StatefulWidget {
  const MenuOptionsScreen({super.key});

  @override
  State<MenuOptionsScreen> createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  void _startAnimationSequence() {
    // Primero reseteamos todos los controladores
    _controller1.reset();
    _controller2.reset();
    _controller3.reset();

    // Luego iniciamos la secuencia
    _controller1.forward().then((_) {
      _controller2.forward().then((_) {
        _controller3.forward();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 550),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _startAnimationSequence();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reiniciar animaciones cuando la ruta cambia
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimationSequence();
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

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
              ScaleTransition(
                scale: _controller1,
                child: _buildImageButton(
                  context,
                  'assets/buttons/badges.png',
                  () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const BadgesScreen(),
                      transitionDuration: Duration.zero,
                    ),
                  ).then((_) => _startAnimationSequence()),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _controller2,
                    child: _buildImageButton(
                      context,
                      'assets/buttons/album.png',
                      () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AlbumScreen(),
                          transitionDuration: Duration.zero,
                        ),
                      ).then((_) => _startAnimationSequence()),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ScaleTransition(
                    scale: _controller3,
                    child: _buildImageButton(
                      context,
                      'assets/buttons/ranking.png',
                      () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const RankingScreen(),
                          transitionDuration: Duration.zero,
                        ),
                      ).then((_) => _startAnimationSequence()),
                    ),
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
          border: Border.all(
            color: Colors.orange,
            width: 3,
          ),
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
