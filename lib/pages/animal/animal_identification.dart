import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class AnimalIdentification extends StatefulWidget {
   AnimalIdentification({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  State<AnimalIdentification> createState() => _AnimalIdentificationState();
}

class _AnimalIdentificationState extends State<AnimalIdentification> {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _capturedImage;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> capturePhoto() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: 50,
    );

    if (image != null) {
      setState(() {
        _capturedImage = image;
      });
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _capturedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.user?.email ?? '')),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: const Color(0xFF23D498),
      body: Center(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Welcome for detection',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: "Cholcolate",
                  ),
                ),
                const SizedBox(height: 70),
                Center(
                  child: _capturedImage != null
                      ? Image.file(File(_capturedImage!.path))
                      : const Text('No image captured/loaded'),
                ),
                const SizedBox(height: 50),
                MyButton(onTap: capturePhoto, text: "Capture a picture"),
                const SizedBox(height: 20), // Added spacing between buttons
                MyButton(onTap: pickImageFromGallery, text: "Load a picture"),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}