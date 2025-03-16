/* Authored by: Joseph Angelo Q. Petalio
Company: Rectrix
Project: Menti
Feature: [MNT-001] Splash Screen
Description: This code initializes a Flutter application with a splash screen that transitions to a sign-up screen.
 */

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'entry/signup.dart';
// import 'entry/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Sign Up Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: AnimatedSplashScreen(
        splash: 'assets/menti_logo.png',
        splashIconSize: 150.0,
        centered: true,
        nextScreen: const SignUpScreen(),
        backgroundColor: Colors.white,
        duration: 3100,
      ),
    );
  }
}
