import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/register_page/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: GoogleFonts.abhayaLibre(
                  fontSize: 40,
                  color: Colors.white,
                )
                //TextStyle(fontSize: 35, color: Colors.white),
                ,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 380, right: 35, left: 35),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 80, 79, 79),
                      ),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Color.fromARGB(255, 80, 79, 79),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 80, 79, 79),
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c5056),
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            // ignore: inference_failure_on_instance_creation
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c5056),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot  Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c5056),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
