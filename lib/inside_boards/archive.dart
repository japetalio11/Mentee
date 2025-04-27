/* Authored by: Hans Ernie V. San Miguel
Company: Rectrix
Project: Menti
Feature: [MNT-001] Inside Boards - Archive Screen
Description: This code initializes the Archive screen for managing archived tasks.
 */

import 'package:flutter/material.dart';
import 'package:menti_application/inside_boards/backlog_screen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

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
              _buildTopBar(context),
              const SizedBox(height: 60), // Gap between back button and title
              _buildTitleWithIndicator(),
              const SizedBox(height: 16), // Gap between title and content
              Expanded(child: _buildContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        // ← Back
        _circleButton(
          Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const BacklogScreen(),
              ), // Redirect to Backlogs
            );
          },
        ),
      ],
    );
  }

  Widget _buildTitleWithIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Archive",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0066FF), // Blue color for the title
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 4), // Space between title and underline
        Container(
          height: 2,
          width: 60, // Width of the underline
          color: const Color(0xFF0066FF), // Blue color for the underline
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Center(
      child: const Text(
        'No Archives yet',
        style: TextStyle(fontSize: 18, color: Color(0xFF1E1E2D)),
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
