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
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<String> payment = <String>[
  'Male',
  'Female',
];
String dropdownValue = payment.first;

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
                    stream: userRef.doc(auth.currentUser!.uid).snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final profiletems = snapshot.data;
                        print(profiletems['userName']);
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
                                    labelText:
                                        profiletems['userName'].toString(),
                                    labelStyle: GoogleFonts.adamina(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
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
                                    labelText: profiletems['email'].toString(),
                                    labelStyle: GoogleFonts.adamina(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
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
                              const SizedBox(
                                height: 18,
                              ),
                              SizedBox(
                                width: 350,
                                child: Card(
                                  shadowColor: Colors.redAccent,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 225, 223, 223),
                                    ),
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          child: DropdownButton<String>(
                                            value: dropdownValue,
                                            isExpanded: true,
                                            icon: const Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 30,
                                            ),
                                            elevation: 16,
                                            style: GoogleFonts.abhayaLibre(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                dropdownValue = value!;
                                              });
                                            },
                                            items: payment
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )
                                    ],
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
                    children: [
                      GestureDetector(
                        onTap: () => profilebloc.add(
                          AddProfile(
                            name: namecontroller.text,
                            email: emailcontroller.text,
                            age: agecontroller.text,
                            image: pickedFile,
                            gander: dropdownValue,
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
