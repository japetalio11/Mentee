import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menti_application/home/dashboard.dart';
import 'package:menti_application/home/settings.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<String> tabs = ["Assigned", "Missing", "Done"];
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

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

              const SizedBox(height: 60),

              // Custom Tab Row
                Stack(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: tabs.map((tab) {
                      int index = tabs.indexOf(tab);
                      return Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: GestureDetector(
                        onTap: () => _onTabTapped(index),
                        child: Text(
                        tab,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: _selectedIndex == index
                            ? FontWeight.w600
                            : FontWeight.w500,
                          color: _selectedIndex == index
                            ? const Color(0xFF4D94FF)
                            : const Color(0xFFA2A2A7),
                        ),
                        ),
                      ),
                      );
                    }).toList(),
                    ),
                  ],
                ),

              const Divider(
                height: 32,
                thickness: 2,
                color: Color(0xFFF4F4F4),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  children: [
                    // Assigned Tasks Page
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'No due date',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),
                          
                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'This week',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),

                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Next week',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),

                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Earlier',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),
                        ],
                      ),
                    ),

                    // Missing Tasks Page
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'No due date',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),
                          
                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'This week',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),

                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Next week',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),

                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Earlier',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),
                        ],
                      ),
                    ),

                    // Done Tasks Page
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'No due date',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),
                          
                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'This week',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),

                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Next week',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),

                          const SizedBox(height: 16),

                          ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Earlier',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E1E2D),
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D94FF),
                                  ),
                                ),
                              ],
                            ),
                            children: const [], // Add tasks here
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

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
                // Task icon pressed
              },
              icon: SvgPicture.asset(
                'assets/images/task.svg',
                width: 30,
                height: 30,
                color: const Color(0xFF4D94FF),
              ),
            ),
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
                'assets/images/settings.svg',
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
