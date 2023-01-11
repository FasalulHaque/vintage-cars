import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintagecars/drawer/view/pages/booking_view.dart';
import 'package:vintagecars/drawer/view/pages/settings.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({
    super.key,
  });

  final users = FirebaseFirestore.instance.collection('Register_collection');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Drawer(
        child: StreamBuilder(
            stream: users.doc(auth.currentUser!.uid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var userData = snapshot.data!;
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 250,
                      child: UserAccountsDrawerHeader(
                        accountName: Text(
                          userData['userName'].toString(),
                          style: GoogleFonts.adamina(
                            fontSize: 14,
                          ),
                        ),
                        accountEmail: Text(
                          userData['email'].toString(),
                          style: GoogleFonts.adamina(
                            fontSize: 14,
                          ),
                        ),
                        currentAccountPictureSize: const Size.square(100),
                        currentAccountPicture: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: getImage,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: (userData['profileImage'] == '')
                                  ? Text(
                                      // ignore: avoid_dynamic_calls
                                      userData['userName'][0]
                                          .toString()
                                          .toUpperCase(),
                                      style: GoogleFonts.alegreyaSansSc(
                                        fontSize: 40,
                                        color: Colors.blue,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                        userData['profileImage'].toString(),
                                        fit: BoxFit.cover,
                                        width: 90,
                                        height: 120,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/image/wp2555730.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: Text(
                        'Favorite',
                        style: GoogleFonts.adamina(color: Colors.black),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    ListTile(
                      leading: const Icon(Icons.bookmarks_rounded),
                      title: Text(
                        'MY Booking',
                        style: GoogleFonts.adamina(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) => BookingView(),
                            ));
                      },
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    ListTile(
                      leading: const Icon(Icons.share),
                      title: Text(
                        'Share',
                        style: GoogleFonts.adamina(color: Colors.black),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: Text(
                        'Notifications',
                        style: GoogleFonts.adamina(color: Colors.black),
                      ),
                      trailing: ClipOval(
                        child: Container(
                          color: Colors.red,
                          width: 20,
                          height: 20,
                          child: Center(
                            child: Text(
                              '7',
                              style: GoogleFonts.adamina(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(
                        'Settings',
                        style: GoogleFonts.adamina(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) => const Settingss(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.adamina(color: Colors.black),
                      ),
                      onTap: () {},
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<void> getImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _imagePicker = ImagePicker();

    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      await updateProfile(image!);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProfile(XFile image) async {
    final reference =
        FirebaseStorage.instance.ref().child('ProfileImage').child(image.name);
    final file = File(image.path);
    await reference.putFile(file);
    final imageLink = await reference.getDownloadURL();

    await users.doc(auth.currentUser!.uid).update({'profileImage': imageLink});
    // ignore: avoid_print
    print(imageLink);
  }
}
