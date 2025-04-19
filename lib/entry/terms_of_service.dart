import 'package:flutter/material.dart';
import 'package:menti_application/entry/signup.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

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
              // Status bar with time, signal etc is part of the mobile OS
              
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFFA2A2A7)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const SignUpScreen(),
                          
                        ),
                      );
                    },
                  ),
                ),
              
              const SizedBox(height: 48),
              
              
              // Content - wrapped in Expanded and SingleChildScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E1E2D),
                        ),
                      ),
                      SizedBox(height: 50),


                      TermsText(
                        'By accessing and using this website, you agree to comply with and be bound by these Terms of Service. \n\nThese terms govern your use of the site, including all content, features, and services provided on it. \n\nYou must not use this website for any unlawful purpose or in any way that may cause damage or disruption to the site, its users, or its content. \n\nYou are responsible for ensuring the confidentiality of your account and credentials and for all activities that occur under your account. \n\nWe reserve the right to modify, suspend, or discontinue any aspect of the site or its services at any time, without notice. \n\nAny violation of these terms may result in the suspension or termination of your access to the site. By using this site, you agree to hold harmless and indemnify us against any claims or damages arising from your use of the site. \n\nWe also reserve the right to update or modify these Terms and Conditions periodically, and your continued use of the site after any such changes signifies your acceptance of the updated terms.'
                      ),
                      SizedBox(height: 16.0),

                    ],
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

class TermsText extends StatelessWidget {
  final String text;
  
  const TermsText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13.0,
        color: Colors.black87,
        height: 1.5,
        wordSpacing: 1.2,
        letterSpacing: 0.2,
      ),
    );
  }
}