import 'package:flutter/material.dart';
import 'package:menti_application/entry/signup.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
              const SizedBox(height: 16),
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
                        'Your privacy is important to us. This Privacy Policy outlines how we collect, use, store, and protect your personal information.\n\nWe collect personal data when you visit our website, register for an account, or interact with our services.\n\nThe information we collect may include your name, email address, phone number, and any other data you provide voluntarily.\n\nWe use this information to provide you with a personalized experience, process transactions, and communicate important updates or promotional offers.\n\nWe do not sell or share your personal data with third parties without your consent, except when required by law.\n\nWe take reasonable steps to protect your data from unauthorized access, use, or disclosure. However, no method of data transmission over the internet is 100% secure, and while we strive to protect your personal information, we cannot guarantee its absolute security.\n\nBy using our website, you consent to the collection and use of your personal information as described in this policy. We may update this Privacy Policy from time to time, and we encourage you to review it periodically to stay informed about how we protect your data.'

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