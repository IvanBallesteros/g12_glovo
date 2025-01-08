import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class VeureMesScreen extends StatefulWidget {
  final String title;

  const VeureMesScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<VeureMesScreen> createState() => _VeureMesScreenState();
}

class _VeureMesScreenState extends State<VeureMesScreen> {
  List<Map<String, dynamic>> commerces = [];
  Map<String, String> logros = {};
  Map<String, int> maxLogros = {};

  final Map<String, String> nomTransformations = {
    'mcdo': 'McDonald\'s',
    'burgerking': 'Burger King',
    'latagliatella': 'La Tagliatella',
    'vicio': 'Vicio',
    'fosters': 'Foster\'s Hollywood',
    'goiko': 'Goiko Grill',
    'chalito': 'Chalito',
    'kfc': 'KFC',
    'tacobell': 'Taco Bell',
    'fiveguys': 'Five Guys',
    "ametllerorigen": "Ametller Origen",
    "caprabo": "Caprabo",
    "carrefour": "Carrefour",
    "condis": "Condis",
    "sorli": "Sorli",
    "miscota": "Miscota",
    "alcampo": "Alcampo",
    "lasirena": "La Sirena",
    "veritas": "Veritas",
    "calfruitos": "Cal Fruitós",
    "decathlon": "Decathlon",
    "drim": "Drim",
    "druni": "Druni",
    "flyingtiger": "Flying Tiger",
    "fnac": "Fnac",
    "kiwoko": "Kiwoko",
    "mediamarkt": "Media Markt",
    "primor": "Primor",
    "kiko": "Kiko",
    "tiendanimal": "Tiendanimal",
  };

  @override
  void initState() {
    super.initState();
    loadCommerces();
    loadLogros();
  }

  Future<void> loadCommerces() async {
    final String response = await rootBundle.loadString('lib/json/logro1.json');
    final data = await json.decode(response);
    setState(() {
      commerces = List<Map<String, dynamic>>.from(data[widget.title]);
    });
  }

  Future<void> loadLogros() async {
    final String response = await rootBundle.loadString('lib/json/logros.json');
    final data = await json.decode(response);
    setState(() {
      logros = Map<String, String>.from(
          data.map((key, value) => MapEntry(key, value.toString())));
      maxLogros = {
        'logro1': data['maxlogro1'],
        'logro2': data['maxlogro2'],
        'logro3': data['maxlogro3'],
        'logro4': data['maxlogro4'],
        'logro5': data['maxlogro5'],
      };
    });
  }

  String transformNom(String nom) {
    return nomTransformations[nom] ?? nom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromRGBO(255, 194, 68, 1),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromRGBO(255, 194, 68, 1),
        child: commerces.isEmpty
            ? Center(child: Text('No hay comercios disponibles'))
            : ListView.builder(
                itemCount: commerces.length,
                itemBuilder: (context, index) {
                  final commerce = commerces[index];
                  final transformedNom = transformNom(commerce['nom']);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Image.asset(
                                  'assets/images/${commerce['nom']}.png'),
                              title: Text(
                                transformedNom,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            for (int i = 1; i <= 5; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Logro $i:',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        if (commerce['progression'] >=
                                            maxLogros['logro$i']!)
                                          Icon(Icons.check,
                                              color: Colors.green),
                                      ],
                                    ),
                                    Text(logros['logro$i'] ?? ''),
                                    LinearProgressIndicator(
                                      value: commerce['progression'] /
                                          maxLogros['logro$i']!,
                                      backgroundColor: Colors.grey[300],
                                      color:
                                          const Color.fromRGBO(255, 194, 68, 1),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
