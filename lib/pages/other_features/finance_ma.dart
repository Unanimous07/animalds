import 'package:flutter/material.dart';

class FinanceMa extends StatelessWidget {
  const FinanceMa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Management'),
      ),
      body: const Center(
        child: Text('Finance Management'),
      ),
    );
  }
}