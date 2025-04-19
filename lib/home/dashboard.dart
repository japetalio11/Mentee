import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menti_application/entry/signin.dart';
import 'package:menti_application/home/tasks.dart';
import 'package:menti_application/home/settings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
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
                        'Welcome back,',
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                        const Text(
                        'Joseph Angelo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1E1E2D),
                        ),
                        ),
                      ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {
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
                      icon: SvgPicture.asset(
                      'assets/images/logout.svg', // Add your SVG file path here
                      width: 22,
                      height: 22,
                      color: const Color(0xFF707070),
                      ),
                      padding: const EdgeInsets.all(13),
                      style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFF4F4F4),
                      shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA2A2A7),
                        fontSize: 13,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          width: 20,
                          height: 20,
                          color: const Color(0xFF707070),
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.close,
                        color: Color(0xFF707070),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                Row(
                  children: [
                    const Text(
                      'Your Boards',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E1E2D),
                      ),
                    ),
                    const SizedBox(height: 50),

                    const Spacer(),

                    GestureDetector(
                      child: const Text(
                        'See Calendar',
                        style: TextStyle(
                          color: Color(0xFF4D94FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      onTap: () {
                        // Navigator.of(context).pushReplacement(
                        //   PageRouteBuilder(
                        //     pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        //       return FadeTransition(
                        //         opacity: animation,
                        //         child: child,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),

                const Divider(
                  height: 16,
                  thickness: 2,
                  color: Color(0xFFF4F4F4),
                ),
                const SizedBox(height: 13),

                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   PageRouteBuilder(
                      //     pageBuilder: (context, animation, secondaryAnimation) => const VerificationScreen(),
                      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      //       return FadeTransition(
                      //         opacity: animation,
                      //         child: child,
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Create New Board',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA2A2A7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Button 1 - Replace Icon with your own
            IconButton(
              onPressed: () {
              // Add your logout logic here
              },
              icon: SvgPicture.asset(
              'assets/images/home.svg', // Add your SVG file path here
              width: 36,
              height: 36,
              color: const Color(0xFF4D94FF),
              ),
            ),

            // Button 2 - Replace Icon with your own
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const TasksScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              icon: SvgPicture.asset(
              'assets/images/task.svg', // Add your SVG file path here
              width: 30,
              height: 30,
              color: const Color(0xFF707070),
              ),
            ),

            // Button 3 - Replace Icon with your own
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SettingsScreen(),
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
              'assets/images/settings.svg', // Add your SVG file path here
              width: 36,
              height: 36,
              color: const Color(0xFF707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
