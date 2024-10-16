import 'package:authentication/components/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {

  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.user?.email ?? '')),
        actions: [
          IconButton(
            onPressed: () {
              widget.signUserOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],

      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Home Page'),

      ),
    );
  }
}