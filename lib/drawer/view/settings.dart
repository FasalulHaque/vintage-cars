import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFF5F6F9),
                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(  
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.help,
                        color: Color.fromARGB(255, 246, 113, 103),
                      ),
                      title: Text(
                        'Help & Support',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Notificationn(),
              //     ),
              //   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFF5F6F9),
                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.privacy_tip,
                        color: Color.fromARGB(255, 246, 113, 103),
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Notificationn(),
              //     ),
              //   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFF5F6F9),
                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.language,
                        color: Color.fromARGB(255, 246, 113, 103),
                      ),
                      title: Text(
                        'Language',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Notificationn(),
              //     ),
              //   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFF5F6F9),
                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'assets/image/3842634-200.png',
                        color: const Color.fromARGB(255, 246, 113, 103),
                        width: 27,
                        height: 27,
                      ),
                      title: Text(
                        'Terms & Conditions',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Notificationn(),
              //     ),
              //   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFF5F6F9),
                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'assets/image/Very-Basic-About-icon-removebg-preview.png',
                        color: const Color.fromARGB(255, 246, 113, 103),
                        width: 22,
                        height: 37,
                      ),
                      // Icon(
                      //   Icons.language,
                      //   color: Color.fromARGB(255, 246, 113, 103),
                      // ),
                      title: Text(
                        'About',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Notificationn(),
              //     ),
              //   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFF5F6F9),
                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: Color.fromARGB(255, 246, 113, 103),
                      ),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Notificationn(),
              //     ),
              //   ),
            ),
          ),
        ],
      ),
    );
  }
}
