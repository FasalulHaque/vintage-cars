import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 82),
          child: Text(
            'Electric Car',
            style: GoogleFonts.abel(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
