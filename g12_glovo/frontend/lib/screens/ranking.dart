import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool isMensualSelected = true;
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final String response = await rootBundle.loadString('lib/json/points.json');
    final data = json.decode(response);

    setState(() {
      users = List<Map<String, dynamic>>.from(data['users']);
    });
  }

  List<Map<String, dynamic>> getTopUsers() {
    List<Map<String, dynamic>> sortedUsers = List.from(users);
    sortedUsers.sort((a, b) => isMensualSelected
        ? b['mPoints'].compareTo(a['mPoints'])
        : b['gPoints'].compareTo(a['gPoints']));
    return sortedUsers.take(10).toList();
  }

  Color getCardColor(int index) {
    switch (index) {
      case 0:
        return Colors.amber[400]!;
      case 1:
        return Colors.grey[400]!;
      case 2:
        return Colors.brown[400]!;
      default:
        return Colors.black87;
    }
  }

  Color getTextColor(int index) {
    return index < 3 ? Colors.black : Colors.white;
  }

  Color getCircleColor(int index) {
    return index < 3 ? Colors.black : Colors.grey;
  }

  Color getCircleTextColor(int index) {
    return index < 3 ? Colors.white : Colors.black;
  }

  BoxDecoration getCardDecoration(int index) {
    return BoxDecoration(
      color: getCardColor(index),
      border: Border.all(
        color: index < 3 ? Colors.white : Colors.grey,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  double getCardWidth(int index, double maxWidth) {
    switch (index) {
      case 0:
        return maxWidth * 0.95;
      case 1:
        return maxWidth * 0.90;
      case 2:
        return maxWidth * 0.85;
      default:
        return maxWidth * 0.50;
    }
  }

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
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView.builder(
                      itemCount: getTopUsers().length,
                      itemBuilder: (context, index) {
                        final user = getTopUsers()[index];
                        return Container(
                          width: getCardWidth(index, constraints.maxWidth),
                          decoration: getCardDecoration(index),
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: getCircleColor(index),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                    color: getCircleTextColor(index),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            title: Text(
                              user['nom'],
                              style: TextStyle(
                                  color: getTextColor(index),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            subtitle: Text(
                              isMensualSelected
                                  ? 'Punts totals: ${user['gPoints']}'
                                  : 'Punts mensuals: ${user['mPoints']}',
                              style: TextStyle(
                                  color: getTextColor(index).withOpacity(0.7),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              isMensualSelected
                                  ? '${user['mPoints']}'
                                  : '${user['gPoints']}',
                              style: TextStyle(
                                color: getTextColor(index),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
