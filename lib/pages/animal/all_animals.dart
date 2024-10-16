import 'package:flutter/material.dart';

class AllAnimals extends StatefulWidget {
  const AllAnimals({super.key});

  @override
  State<AllAnimals> createState() => _AllAnimalsState();
}

class _AllAnimalsState extends State<AllAnimals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Animals'),
      ),
      body: const Center(
        child: Text('All Animals'),
      ),
    );
  }
}