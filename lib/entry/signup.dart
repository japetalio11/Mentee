/* Authored by: Joseph Angelo Q. Petalio
Company: Rectrix
Project: Menti
Feature: [MNT-002] Sign Up Screen
Description: This file contains the implementation of the Sign Up screen for the Menti application.
*/

import 'package:flutter/material.dart';
import 'package:menti_application/entry/signin.dart';
import 'package:menti_application/getting_started/onboarding.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E1E2D),
                  ),
                ),
                const SizedBox(height: 50),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(
                              color: Color(0xFFA2A2A7),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _firstNameController,
                            style: const TextStyle(fontSize: 13),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: Color(0xFFA2A2A7),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0066FF),
                                ),
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Last Name',
                            style: TextStyle(
                              color: Color(0xFFA2A2A7),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),

                          TextField(
                            controller: _lastNameController,
                            style: const TextStyle(fontSize: 13),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4),
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0066FF),
                                ),
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Phone Number',
                  style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      color: Color(0xFFA2A2A7),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0066FF)),
                    ),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Email Address',
                  style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color(0xFFA2A2A7),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0066FF)),
                    ),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Password',
                  style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFFA2A2A7),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFFA2A2A7),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0066FF)),
                    ),
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0066FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account. ',
                      style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF0066FF),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text(
                        'By signing up, you agree to our ',
                        style: TextStyle(
                          color: Color(0xFFA2A2A7),
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Terms of Service',
                          style: TextStyle(
                            color: Color(0xFF0066FF),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Text(
                        ' and ',
                        style: TextStyle(
                          color: Color(0xFFA2A2A7),
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF0066FF),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
