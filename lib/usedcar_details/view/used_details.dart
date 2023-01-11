import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/booking/view/booking.dart';
import 'package:vintagecars/usedcar_details/view/featured_Uscard.dart';

class UsedDetails extends StatelessWidget {
  UsedDetails({super.key, required this.usedcAxis});
  QueryDocumentSnapshot<Object?> usedcAxis;

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
                usedcAxis['cars_image'].toString(),
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
                usedcAxis['cars_name'].toString(),
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
                          usedcAxis['cars_price'].toString(),
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
              mainAxisSpacing: 12,
              children: <Widget>[
                FeturedUsedCard(
                  text: 'Top Speed',
                  value: usedcAxis['max_power'].toString(),
                  image: Image.asset(
                    'assets/image/download__1_-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Fuel Type',
                  value: usedcAxis['fuel_type'].toString(),
                  image: Image.asset(
                    'assets/image/images-removebg-preview (1).png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Transmission',
                  value: usedcAxis['transmission'].toString(),
                  image: Image.asset(
                    'assets/image/istockphoto-466542086-612x612-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Seating',
                  value: usedcAxis['seating'].toString(),
                  image: Image.asset(
                    'assets/image/number-seats-grey-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Registration',
                  value: usedcAxis['registration'].toString(),
                  image: Image.asset(
                    'assets/image/new_plates-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Mileage  ',
                  value: usedcAxis['mileage'].toString(),
                  image: Image.asset(
                    'assets/image/fuel-gauge-icon-meter-full-tank-car-vebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Insurance  ',
                  value: usedcAxis['Insurance'].toString(),
                  image: Image.asset(
                    'assets/image/4669525-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Model  ',
                  value: usedcAxis['model'].toString(),
                  image: Image.asset(
                    'assets/image/red-sedan-car-icon-in-flat-design-vector-16737556-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'Kilometers Driven',
                  value: usedcAxis['kilometers_driven'].toString(),
                  image: Image.asset(
                    'assets/image/speedometer-icon-simple-style-isolated-vector-illustration-auto-spare-parts-symbol-81638125-removebg-preview.png',
                  ),
                ),
                FeturedUsedCard(
                  text: 'regist In',
                  value: usedcAxis['registration_in'].toString(),
                  image: const Icon(Icons.app_registration),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => BookingCars(book: usedcAxis),
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
