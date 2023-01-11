import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});

  final bookingg = FirebaseFirestore.instance.collection('booking_collection');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 19,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: bookingg
            .where('user_id', isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var bookingview = snapshot.data!.docs;
            print(bookingview);
            print('ndbae---bae');
            return ListView.builder(
              itemCount: bookingview.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(bookingview[index]['cars_name'].toString()),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
