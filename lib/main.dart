//import 'package:authentication/pages/auth_page.dart';
import 'package:authentication/pages/animal/add_animal.dart';
import 'package:authentication/pages/animal/all_animals.dart';
import 'package:authentication/pages/animal/animal_identification.dart';
import 'package:authentication/pages/animal/sick_animals.dart';
import 'package:authentication/pages/auth_page.dart';
import 'package:authentication/pages/farmer/analytics.dart';
import 'package:authentication/pages/home_page.dart';
import 'package:authentication/pages/other_features/cold_houses.dart';
import 'package:authentication/pages/other_features/finance_ma.dart';
import 'package:authentication/pages/other_features/markets.dart';
import 'package:authentication/pages/other_features/vet_clinics.dart';
import 'package:authentication/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MySplashScreen(),
      routes: {
        "/dashboard": (context) => HomePage(),
        "/analytics": (context) => const Analytics(),
        "/identify": (context) => AnimalIdentification(),
        "/all_animals": (context) => const AllAnimals(),
        "/sick_animals": (context) => const SickAnimals(),
        "/add_animal": (context) => const AddAnimal(),
        "/vet_clinics": (context) => const VetClinics(),
        "/auth": (context) => const AuthPage(),
        "/markets": (context) => const Markets(),
        "/cold_houses": (context) => const ColdHouses(),
        "/finance": (context) => const FinanceMa(),
      },
    );
  }
}
