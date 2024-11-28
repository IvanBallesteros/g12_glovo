import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool isMensualSelected = true;

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
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 112, 95, 212),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
                child: Container(
              height: 60,
              width: 300,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 163, 156, 206),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isMensualSelected
                          ? const Color.fromARGB(255, 112, 95, 212)
                          : const Color.fromARGB(255, 163, 156, 206),
                      foregroundColor:
                          isMensualSelected ? Colors.white : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(125, 30),
                    ),
                    onPressed: () {
                      setState(() {
                        isMensualSelected = true;
                      });
                    },
                    child: const Text("Mensual"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isMensualSelected
                          ? const Color.fromARGB(255, 163, 156, 206)
                          : const Color.fromARGB(255, 112, 95, 212),
                      foregroundColor:
                          isMensualSelected ? Colors.white : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(125, 30),
                    ),
                    onPressed: () {
                      setState(() {
                        isMensualSelected = false;
                      });
                    },
                    child: const Text("General"),
                  ),
                ],
              ),
            )),
            Image.asset(
              'assets/buttons/podium.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "1. Ivan Ballesteros Felipe\n2. Sergio Delgado\n3. Marc Sardà\n4. Miquel Gibert\n5. Marc Serra\n6. Marc Serra\n7. Marc Serra\n8. Marc Serra\n9. Marc Serra\n10. Marc Serra\n11. Marc Serra\n12. Marc Serra\n13. Marc Serra\n14. Marc Serra\n15. You")
          ],
        ));
  }
}
