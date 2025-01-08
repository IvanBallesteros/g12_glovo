import 'package:flutter/material.dart';

class VeureMesScreen extends StatefulWidget {
  final String title;

  const VeureMesScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<VeureMesScreen> createState() => _VeureMesScreenState();
}

class _VeureMesScreenState extends State<VeureMesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Text('Content for ${widget.title}'),
      ),
    );
  }
}
