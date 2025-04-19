/* Authored by: Joseph Angelo Q. Petalio
Company: Rectrix
Project: Menti
Feature: [MNT-001] Splash Screen
Description: This code initializes a Flutter application with a splash screen that transitions to a sign-up screen.
 */

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add Firebase core import
import 'firebase_options.dart'; // Import the generated firebase_options.dart file
import 'entry/signup.dart';
// import 'entry/login.dart';

void main() async {
  // Ensure that Flutter is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the configuration from firebase_options.dart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Now run the app after Firebase has been initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Mentee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        splashColor: Colors.white, // ripple color
        highlightColor: Colors.white, // removes tap glow
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF4D94FF), // your app’s primary color
        ),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/images/menti_logo.png',
        splashIconSize: 150.0,
        centered: true,
        nextScreen: const SignUpScreen(),
        backgroundColor: Colors.white,
        duration: 3100,
      ),
    );
  }
}