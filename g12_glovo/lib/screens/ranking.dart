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
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            "Ranking ${isMensualSelected ? 'Mensual' : 'General'}",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: const Color.fromARGB(255, 112, 95, 212),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Container(
                height: 60,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.black,
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
                'assets/images/podium.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "4. Miquel Gibert\n5. Ivan Ballesteros Felipe\n6. Sergio Delgado\n7. Marc Sardà\n8. Marc Serra\n9. Marc Serra\n10. Marc Serra\n11. Marc Serra\n12. Marc Serra\n13. Marc Serra\n14. Marc Serra\n------------------\n3415. You",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
