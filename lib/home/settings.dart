import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menti_application/home/dashboard.dart';
import 'package:menti_application/home/tasks.dart';
import 'package:menti_application/home/settings/personal_information.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),

              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                    'assets/images/temp-profile.png',
                    ), // Add your profile image to assets
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                        'Joseph Angelo Petalio',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1E1E2D),
                          ),
                        ),

                        const Text(
                        'Senior Developer',
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const PersonalInformationScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                  SvgPicture.asset(
                    'assets/images/person.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xFF707070),
                  ),
                  const SizedBox(width: 16),

                  const Text(
                    'Personal Information',
                    style: TextStyle(color: Color(0xFF1E1E2D), fontSize: 13),
                  ),

                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/right-arrow.svg',
                    color: const Color(0xFF707070),
                  ),
                  ],
                ),
              ),

              const Divider(
                height: 32,
                thickness: 2,
                color: Color(0xFFF4F4F4),
              ),

              GestureDetector(
                onTap: () {
                  // Add your navigation or action here
                },
                child: Row(
                  children: [
                  SvgPicture.asset(
                    'assets/images/archive.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xFF707070),
                  ),
                  const SizedBox(width: 16),

                  const Text(
                    'Archived Boards',
                    style: TextStyle(color: Color(0xFF1E1E2D), fontSize: 13),
                  ),

                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/right-arrow.svg',
                    color: const Color(0xFF707070),
                  ),
                  ],
                ),
              ),

              // End Code

            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DashboardScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                width: 36,
                height: 36,
                color: const Color(0xFF707070),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TasksScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/images/task.svg',
                width: 30,
                height: 30,
                color: const Color(0xFF707070),
              ),
            ),
            IconButton(
              onPressed: () {
                // Settings icon pressed
              },
              icon: SvgPicture.asset(
                'assets/images/settings.svg',
                width: 36,
                height: 36,
                color: const Color(0xFF4D94FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
