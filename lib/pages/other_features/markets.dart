import 'package:flutter/material.dart';


class Markets extends StatelessWidget {
  const Markets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Markets'),
      ),
      body: const Center(
        child: Text('Animal Markets'),
      ),
    );
  }
}