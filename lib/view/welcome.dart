

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/view/chatscreen.dart';

class WelcomeScreen extends StatelessWidget {
  final Color customOrange = const Color(0xFFF86320);
  final Color customWhite = const Color(0xFFFFFFFF);
  final Color customGrey = const Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhite,
      body: SafeArea(
        child: Stack(
          children: [
            // Skip button at the top right
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: GoogleFonts.dmSans(
                    color: customOrange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Centered content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: customOrange.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: customWhite,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: customOrange,
                            width: 8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: customOrange.withOpacity(0.3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                       
                       child: Center(
  child: ClipOval(
    child: Container(
      width: 120, 
      height: 120, 
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg'),
          fit: BoxFit.cover, 
        ),
      ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to',
                        style: GoogleFonts.dmSans(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: customGrey,
                        ),
                      ),
                      Text(
                        'Halodek',
                        style: GoogleFonts.dmSans(
                          fontSize: 36, 
                          fontWeight: FontWeight.bold,
                          color: customGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Halodek supports sending and receiving a variety of media: text, photos, videos, documents, and location, as well as voice calls.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: customGrey,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: customOrange,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Let's Get Started",
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Already have an account? Login',
                      style: GoogleFonts.dmSans(
                        color: customGrey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
