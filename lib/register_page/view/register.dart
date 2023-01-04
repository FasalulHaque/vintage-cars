// ignore_for_file: avoid_redundant_argument_values, use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/home/view/home.dart';
import 'package:vintagecars/login_page/view/login.dart';
import 'package:vintagecars/register_page/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authblocc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authblocc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/register.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, top: 50),
                    child: Text(
                      'Create\nAccount',
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 40, color: Colors.white),
                      //TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 235, right: 35, left: 35),
                  child: ListView(
                    children: [
                      TextField(
                        controller: nameController,
                        style: GoogleFonts.abhayaLibre(),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 80, 79, 79),
                          ),
                          hintText: 'User Name',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextField(
                        controller: emailController,
                        style: GoogleFonts.abhayaLibre(),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Color.fromARGB(255, 80, 79, 79),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextField(
                        controller: numberController,
                        style: GoogleFonts.abhayaLibre(),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          prefixIcon: const Icon(
                            Icons.mobile_friendly,
                            color: Color.fromARGB(255, 80, 79, 79),
                          ),
                          hintText: 'Mobile Number',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextField(
                        controller: passwordController,
                        style: GoogleFonts.abhayaLibre(),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),

                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          suffixIcon: const Icon(
                            Icons.visibility,
                            color: Color.fromARGB(255, 80, 79, 79),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 80, 79, 79),
                          ),

                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Register',
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
                              onPressed: () => authblocc.add(
                                RegisterrEvent(
                                  userName: nameController.text,
                                  email: emailController.text,
                                  mobileNumber: double.parse(
                                    numberController.text,
                                  ),
                                  password: passwordController.text,
                                ),
                              ),
                              color: Colors.white,
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
