import 'package:flutter/material.dart';

class MySquere extends StatelessWidget {
  const MySquere({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        color: const Color(0xFF23D498),
       ),
      );
  }
}