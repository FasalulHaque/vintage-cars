import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 18,
          ),
        ),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 180,
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/image/download__1_-removebg-preview.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
