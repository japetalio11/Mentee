import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:menti_application/home/settings.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final TextEditingController _editEmailController = TextEditingController(
    text: "japetalio@gbox.adnu.edu.ph",
  );
  final TextEditingController _editPasswordController = TextEditingController(
    text: "supotsidebs",
  );
  final TextEditingController _editFirstNameController = TextEditingController(
    text: "Joseph Angelo",
  );
  final TextEditingController _editLastNameController = TextEditingController(
    text: "Petalio",
  );
  final TextEditingController _editRoleController = TextEditingController(
    text: "Senior Developer",
  );
  final bool _obscureText = true;

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // Further reduce quality for faster performance
      maxWidth: 400, // Reduce max width
    );

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      if (await imageFile.length() < 500000) {
        // Check file size under ~500 KB
        setState(() {
          _image = imageFile;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              const SettingsScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/left-arrow.svg',
                  color: const Color(0xFF707070),
                ),
                padding: const EdgeInsets.all(13),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF4F4F4),
                  shape: const CircleBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              _image != null
                                  ? FileImage(_image!)
                                  : const AssetImage('assets/images/temp-profile.png')
                                      as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/edit.svg',
                            color: const Color(0xFF707070),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Joseph Angelo Petalio',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Color(0xFF1E1E2D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
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
                        controller: _editFirstNameController,
                        style: const TextStyle(fontSize: 13),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Color(0xFFA2A2A7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4D94FF)),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
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
                        controller: _editLastNameController,
                        style: const TextStyle(fontSize: 13),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4D94FF)),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Role',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _editRoleController,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4D94FF)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Email Address',
              style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _editEmailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/images/email.svg',
                    color: (Color(0xFFA2A2A7)),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4D94FF)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Password',
              style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
            ),
            TextField(
              controller: _editEmailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/images/password.svg',
                    color: (Color(0xFFA2A2A7)),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4D94FF)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),

            const SizedBox(height: 42),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Joined ',
                    style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 13),
                  ),
                  Text(
                    'March 32, 2025',
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
      ),
    );
  }
}
