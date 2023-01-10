import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/electric_details/view/bookin_electric.dart';
import 'package:vintagecars/electric_details/view/widgets/featured_Ecard.dart';

class ElectricDetails extends StatelessWidget {
  ElectricDetails({super.key, required this.electricAxis});

  QueryDocumentSnapshot<Object?> electricAxis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.favorite_border_sharp, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Image.network(
                electricAxis['cars_image'].toString(),
                fit: BoxFit.cover,
                height: 230,
                width: 230,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 46,
                top: 13,
              ),
              child: Text(
                electricAxis['cars_name'].toString(),
                style: GoogleFonts.actor(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 13),
                height: 50,
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 230, 230),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        'Price Starts From',
                        style: GoogleFonts.anonymousPro(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          electricAxis['cars_price'].toString(),
                          style: GoogleFonts.aBeeZee(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 46),
                child: Text(
                  'Select Color',
                  style: GoogleFonts.acme(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 46),
                  child: colorDot(Colors.red),
                ),
                colorDot(Colors.black),
                colorDot(Colors.blue),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46),
              child: Text(
                'Main Freature',
                style: GoogleFonts.acme(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              childAspectRatio: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 7,
              children: <Widget>[
                FeturedCard(
                  text: 'Top Speed',
                  value: electricAxis['top_speed'].toString(),
                  image: Image.asset(
                    'assets/image/download__1_-removebg-preview.png',
                  ),
                ),
                FeturedCard(
                  text: 'Fuel Type',
                  value: electricAxis['fuel_type'].toString(),
                  image: Image.asset(
                    'assets/image/images-removebg-preview (1).png',
                  ),
                ),
                FeturedCard(
                  text: 'Transmission',
                  value: electricAxis['transmission'].toString(),
                  image: Image.asset(
                    'assets/image/istockphoto-466542086-612x612-removebg-preview.png',
                  ),
                ),
                FeturedCard(
                  text: 'Seating',
                  value: electricAxis['seating_capacity'].toString(),
                  image: Image.asset(
                    'assets/image/number-seats-grey-removebg-preview.png',
                  ),
                ),
                FeturedCard(
                  text: 'Battery',
                  value: electricAxis['battery_capacity'].toString(),
                  image: Image.asset(
                    'assets/image/power-battery-2195871-1887280-removebg-preview.png',
                  ),
                ),
                FeturedCard(
                  text: 'Dr Range',
                  value: electricAxis['driving_range'].toString(),
                  image: Image.asset(
                    'assets/image/rhfg-removebg-preview.png',
                  ),
                ),
                FeturedCard(
                  text: 'Safety',
                  value: electricAxis['safety'].toString(),
                  image: Image.asset(
                    'assets/image/4669525-removebg-preview.png',
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => BookingElectric(
                      book: electricAxis,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 47, right: 50, left: 50),
                height: 55,
                width: MediaQuery.of(context).size.width - 60,
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
                        'BOOK NOW',
                        style: GoogleFonts.acme(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 19,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container colorDot(Color color) {
    return Container(
      margin: EdgeInsets.all(3),
      height: 31,
      width: 31,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
