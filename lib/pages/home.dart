import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'No Frills Academy',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
