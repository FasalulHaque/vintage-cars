import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/usedcar_details/view/used_details.dart';

class UsedCar extends StatelessWidget {
  UsedCar({super.key});

  CollectionReference usedcar =
      FirebaseFirestore.instance.collection('Usedcar_collection');
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              style: GoogleFonts.abel(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                hintText: 'Search',
                suffixIcon: const Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          StreamBuilder(
            stream: usedcar.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final useditems = snapshot.data!.docs;
                return SingleChildScrollView(
                  child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: useditems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 330,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) =>
                                  UsedDetails(usedcAxis: useditems[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            margin: const EdgeInsets.only(top: 18, bottom: 30),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              // Theme.of(context).primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image.network(
                                    useditems[index]['cars_image'].toString(),
                                    height: 100,
                                    width: 200,

                                    //fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  useditems[index]['cars_name'].toString(),
                                  style: GoogleFonts.actor(fontSize: 17),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      height: 70,
                                      width: 15,
                                    ),
                                    const Icon(Icons.currency_rupee),
                                    Text(
                                      useditems[index]['cars_price'].toString(),
                                      style: GoogleFonts.andadaPro(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
