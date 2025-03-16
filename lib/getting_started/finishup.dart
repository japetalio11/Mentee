/* Authored by: Joseph Angelo Q. Petalio
Company: Rectrix
Project: Menti
Feature: [MNT-005] Onboarding #2
Description: This screen collects the user's role information during the onboarding process.
 */

import 'package:flutter/material.dart';
import 'package:menti_application/home/dashboard.dart';

class FinishUpScreen extends StatefulWidget {
  const FinishUpScreen({super.key});

  @override
  State<FinishUpScreen> createState() => _FinishUpScreenState();
}

class _FinishUpScreenState extends State<FinishUpScreen> {
  final TextEditingController _boardController = TextEditingController();

  @override
  void dispose() {
    _boardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Progress indicator
              Row(
                children: [
                  // Blue progress bar
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Color(0xFF0066FF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // Main heading
              const Text(
                'Let\'s Finish Up!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E1E2D),
                  height: 1,
                ),
              ),

              const SizedBox(height: 32),

              // Role question
              const Text(
                'Create Your First Board',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 24),

              // Role label with asterisk
              Row(
                children: const [
                  Text(
                    'Board Name',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '*',
                    style: TextStyle(color: Color(0xFF0066FF), fontSize: 13),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Role text field
              TextField(
                controller: _boardController,
                style: const TextStyle(fontSize: 13),
                decoration: InputDecoration(
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

              const Spacer(),

              // Next button (not shown in the image but typically would be at the bottom)
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const DashboardScreen(), 
                          transitionsBuilder: (context,animation,secondaryAnimation,child,) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0066FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Create Board',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
