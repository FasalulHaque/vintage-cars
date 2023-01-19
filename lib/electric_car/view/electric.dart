import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/electric_details/view/electric_details.dart';

class ElectricCar extends StatelessWidget {
  ElectricCar({
    super.key,
  });

  CollectionReference addCars = FirebaseFirestore.instance.collection(
    'Electriccar_collection',
  );
  TextEditingController searchController = TextEditingController();

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
              controller: searchController,
              style: GoogleFonts.abel(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot<Object?>>(
            stream: addCars.snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
            ) {
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) => ElectricDetails(
                                electricAxis: caritems[index],
                              ),
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
                                Image.network(
                                  caritems[index]['cars_imags'][0].toString(),
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
