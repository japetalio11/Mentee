/* Authored by: Hans Ernie V. San Miguel
Company: Rectrix
Project: Menti
Feature: [MNT-] Inside Boards - In Progress Screen
Description: This code initializes the In Progress screen for managing tasks in progress.
 */

import 'package:flutter/material.dart';
import 'package:menti_application/home/dashboard.dart';
import 'package:menti_application/inside_boards/archive.dart';
import 'package:menti_application/inside_boards/backlog_screen.dart';
import 'package:menti_application/inside_boards/to_do.dart';
import 'package:menti_application/inside_boards/for_testing.dart';
import 'package:menti_application/more/members_screen.dart';
import 'package:menti_application/inside_boards/done_screen.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  final List<String> _tabTitles = [
    "Backlogs",
    "To Do",
    "In Progress",
    "For Testing",
    "Done",
  ];
  int _selectedTabIndex = 2; // Default to "In Progress"
  bool _showOptions = false; // Controls visibility of options menu
  String _selectedPriority = "High Priority"; // Default priority moved to state

  // Navigate to the selected tab
  void _onTabTap(int index) {
    if (_selectedTabIndex == index) return; // Prevent reloading the same screen

    setState(() => _selectedTabIndex = index);

    Widget destination;
    switch (index) {
      case 0:
        destination = const BacklogScreen();
        break;
      case 1:
        destination = const ToDoScreen();
        break;
      case 2:
        destination = const InProgressScreen();
        break;
      case 3:
        destination = const ForTesting();
        break;
      case 4:
        destination = const DoneScreen();
        break;
      default:
        destination = const InProgressScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              const SizedBox(height: 45),
              _buildTitle(),
              const SizedBox(height: 50),
              _buildTabs(),
              const SizedBox(height: 16),
              Expanded(child: _buildTaskCard()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Edit In Progress Tasks')),
          );
        },
        backgroundColor: const Color(0xFF007BFF), // Blue color for the button
        shape: const CircleBorder(),
        child: const Icon(
          Icons.edit,
          size: 24,
          color: Colors.white, // Pen icon
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ← Back
        _circleButton(
          Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const DashboardScreen()),
            );
          },
        ),

        // Exclamation, Archive, and Info
        Row(
          children: [
            _circleButton(
              Icons.error_outline, // Exclamation point icon
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => MembersTab()));
              },
            ),
            const SizedBox(width: 10),
            _circleButton(
              Icons.archive_outlined, // Archive icon
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ArchiveScreen()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Menti",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1E1E2D),
        fontFamily: 'Inter',
      ),
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align tabs to the left
        children: List.generate(_tabTitles.length, (i) {
          final selected = i == _selectedTabIndex;
          return GestureDetector(
            onTap: () => _onTabTap(i),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 24,
              ), // Add spacing between tabs
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    _tabTitles[i],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.normal,
                      color:
                          selected
                              ? const Color(0xFF0066FF)
                              : const Color(0xFFA2A2A7),
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 3,
                    width: 60, // Fixed width for the underline
                    color:
                        selected ? const Color(0xFF0066FF) : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTaskCard() {
    return GestureDetector(
      onTap: () {
        setState(() => _showOptions = !_showOptions);
      },
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ), // Adjust margins
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(12), // Consistent padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Adjust size based on content
                children: [
                  const Text(
                    "Complete API Integration",
                    style: TextStyle(
                      fontSize: 16, // Consistent font size
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 6), // Consistent spacing
                  const Divider(
                    color: Color(
                      0xFFE0E0E0,
                    ), // Light gray color for the separator
                    thickness: 0.5, // Thinner line
                  ),
                  const SizedBox(height: 6), // Consistent spacing
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Assigned to",
                            style: TextStyle(
                              color: Color(0xFFA2A2A7),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 6), // Consistent spacing
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xFF673AB7),
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Priority Level",
                            style: TextStyle(
                              color: Color(0xFFA2A2A7),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6), // Consistent spacing
                          DropdownButton<String>(
                            value: _selectedPriority,
                            items:
                                <String>[
                                  "High Priority",
                                  "Medium Priority",
                                  "Low Priority",
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            value == "High Priority"
                                                ? const Color(0xFFFF3D00)
                                                : value == "Medium Priority"
                                                ? const Color(0xFFFF9800)
                                                : const Color(0xFF4CAF50),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedPriority = newValue!;
                              });
                            },
                            underline: Container(), // Remove underline
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_showOptions)
            Positioned(
              top: 80, // Adjusted position to fit the smaller card
              right: 16,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _optionItem("Delete", const Color(0xFFFF3D00), () {
                      setState(() => _showOptions = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Task deleted')),
                      );
                    }),
                    const Divider(height: 1),
                    _optionItem("Archive", Colors.black, () {
                      setState(() => _showOptions = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Task archived')),
                      );
                    }),
                    const Divider(height: 1),
                    _optionItem("Move", Colors.black, () {
                      setState(() => _showOptions = false);
                      // TODO: open your Move dialog
                    }),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _optionItem(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(text, style: TextStyle(color: color, fontSize: 14)),
      ),
    );
  }

  Widget _circleButton(
    IconData icon, {
    required VoidCallback onTap,
    double size = 40,
    double iconSize = 20,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: iconSize, color: Colors.black),
      ),
    );
  }
}
