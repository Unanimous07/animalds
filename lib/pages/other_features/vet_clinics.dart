import 'package:flutter/material.dart';

class VetClinics extends StatelessWidget {
  const VetClinics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet Clinics'),
      ),
      body: const Center(
        child: Text('Vet Clinics'),
      ),
    );
  }
}