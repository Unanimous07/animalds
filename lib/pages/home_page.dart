import 'package:authentication/components/dash_rectangle.dart';
import 'package:authentication/components/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(widget.user?.email ?? 'No Email',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
        backgroundColor: const Color(0xFF23D498),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: const Color(0xFF23D498),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google
                GestureDetector(
                  child: const DashRectangle(
                    text: "All Animals",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/all_animals');
                  },
                ),

                const SizedBox(width: 20),

                // Facebook
                GestureDetector(
                  child: const DashRectangle(
                    text: "Sick Animals",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/sick_animals');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google
                GestureDetector(
                  child: const DashRectangle(
                    text: "Identify Animal",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/identify');
                  },
                ),

                const SizedBox(width: 20),

                // Facebook
                GestureDetector(
                  child: const DashRectangle(
                    text: "Add Animal",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/add_animal');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(20),
                height: 70,
                width: 420,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "OTHER FEATURES",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google
                GestureDetector(
                  child: const DashRectangle(
                    text: "Animal Markets",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/markets');
                  },
                ),

                const SizedBox(width: 20),

                // Facebook
                GestureDetector(
                  child: const DashRectangle(
                    text: "Vet Clincs",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/vet_clinics');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google
                GestureDetector(
                  child: const DashRectangle(
                    text: "Cold Houses",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/cold_houses');
                  },
                ),

                const SizedBox(width: 20),

                // Facebook
                GestureDetector(
                  child: const DashRectangle(
                    text: "Financial Management",
                    theight: 90.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/finance');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    ));
  }
}
