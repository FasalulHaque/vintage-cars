import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintagecars/dashboard/view/dashboard.dart';
import 'package:vintagecars/profile/bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profile = FirebaseFirestore.instance.collection('profile_collection');
  final FirebaseAuth auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('Register_collection');

  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController agecontroller = TextEditingController();

  Future<XFile?> getimage() async {
    final imagePicker = ImagePicker();
    pickedFile = imagePicker
        .pickImage(
          source: ImageSource.gallery,
        )
        .whenComplete(() => {setState(() {})});
  }

  late Future<XFile?> pickedFile = Future.value(null);
  final profilebloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profilebloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileAddSucess) {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const Dashboard(),
              ),
            );
          }
        },
        child: Scaffold(
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
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: getimage,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      child: FutureBuilder<XFile?>(
                        future: pickedFile,
                        builder: (context, snap) {
                          if (snap.hasData) {
                            return ClipOval(
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                child: Image.file(
                                  File(snap.data!.path),
                                  fit: BoxFit.cover,
                                  width: 180,
                                  height: 180,
                                ),
                                //color: Colors.blue,
                              ),
                            );
                          }
                          return InkWell(
                            onTap: getimage,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              // height: 200.0,
                              // color: Colors.blue,
                              child: Text(
                                'Upload Photo',
                                style: GoogleFonts.abel(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: userRef
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final profiletems = snapshot.data!.docs;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 60,
                                  right: 25,
                                  left: 25,
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  controller: namecontroller,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 10,
                                    ),
                                    labelText:'dgs',
                                  //  profiletems['user_name'].toString(),
                                    labelStyle: GoogleFonts.abel(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 247, 186, 182),
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  right: 25,
                                  left: 25,
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 10,
                                    ),
                                    labelText: 'Email',
                                    labelStyle: GoogleFonts.abel(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 247, 186, 182),
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, right: 25, left: 25,),
                                child: TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.number,
                                  controller: agecontroller,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 10,
                                    ),
                                    labelText: 'Age',
                                    labelStyle: GoogleFonts.abel(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 247, 186, 182),
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => profilebloc.add(
                          AddProfile(
                            name: namecontroller.text,
                            email: emailcontroller.text,
                            age: agecontroller.text,
                            image: pickedFile,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 77,
                            right: 10,
                            left: 30,
                          ),
                          height: 55,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Save',
                                  style: GoogleFonts.acme(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 67, left: 60),
                        height: 55,
                        width: 130,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Edit',
                                style: GoogleFonts.acme(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
