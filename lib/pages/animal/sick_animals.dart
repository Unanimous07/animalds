import 'package:flutter/material.dart';

class SickAnimals extends StatefulWidget {
  const SickAnimals({super.key});

  @override
  State<SickAnimals> createState() => _SickAnimalsState();
}

class _SickAnimalsState extends State<SickAnimals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sick Animals'),
      ),
      body: const Center(
        child: Text('Sick Animals'),
      ),
    );
  }
}