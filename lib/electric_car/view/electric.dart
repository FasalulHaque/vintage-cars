import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/drawer/view/drawer.dart';

class ElectricCar extends StatelessWidget {
  ElectricCar({super.key});

  CollectionReference addCars = FirebaseFirestore.instance.collection(
    'Electriccar_collection',
  );

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer:  DrawerScreen(),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   //automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      //   title: Text(
      //     'Electric Car',
      //     style: GoogleFonts.abel(
      //       color: Colors.white,
      //       fontSize: 25,
      //     ),
      //   ),
      //   systemOverlayStyle: SystemUiOverlayStyle.dark,
      // ),
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
            stream: addCars.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                //print(snapshot.data!.docs);
                final caritems = snapshot.data!.docs;
                return SingleChildScrollView(
                  child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: caritems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 330,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          margin: const EdgeInsets.only(top: 18, bottom: 30),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Image.network(
                                caritems[index]['cars_image'].toString(),
                                height: 100,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                caritems[index]['cars_name'].toString(),
                                style: GoogleFonts.actor(fontSize: 17),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 70,
                                    width: 15,
                                  ),
                                  const Icon(
                                    Icons.currency_rupee,
                                    size: 20,
                                  ),
                                  Text(
                                    caritems[index]['cars_price'].toString(),
                                    style: GoogleFonts.andadaPro(),
                                  )
                                ],
                              )
                            ],
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
