import 'package:flutter/material.dart';

class AddAnimal extends StatelessWidget {
  const AddAnimal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Animal'),
      ),
      body: const Center(
        child: Text('Add Animal'),
      ),
    );
  }
}