import 'package:flutter/material.dart';

class ColdHouses extends StatelessWidget {
  const ColdHouses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cold Houses'),
      ),
      body: const Center(
        child: Text('Cold Houses'),
      ),
    );
  }
}