import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:vintagecars/dashboard/view/dashboard.dart';

class BookingUsed extends StatefulWidget {
  BookingUsed({super.key, required this.book});

  QueryDocumentSnapshot<Object?> book;

  State<BookingUsed> createState() => _BookingUsedState();
}

List<String> list = <String>[
  'Red',
  'Blue',
  'Black',
];
String dropdownValue = list.first;
List<String> payment = <String>[
  'Cash',
  'EMI',
];
String dropdownValueP = payment.first;

class _BookingUsedState extends State<BookingUsed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BOOKING',
          style: GoogleFonts.abel(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26),
            child: SizedBox(
              height: 64,
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),

                    //width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,

                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          widget.book['cars_name'].toString(),
                          // book['top_speed'].toString(),
                          // book['driving_range'].toString(),
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
            child: SizedBox(
              height: 64,
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),
                    //width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,

                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          widget.book['cars_price'].toString(),
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
            child: SizedBox(
              height: 64,
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),

                    //width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,

                // const Color.fromARGB(255, 210, 212, 205),
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          'Check EMI offers',
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
            child: SizedBox(
              height: 64,
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
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
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
            child: SizedBox(
              height: 64,
              child: Card(
                shadowColor: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValueP,
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
                          onChanged: (String? valuee) {
                            setState(() {
                              dropdownValueP = valuee!;
                            });
                          },
                          items: payment
                              .map<DropdownMenuItem<String>>((String valuee) {
                            return DropdownMenuItem<String>(
                              value: valuee,
                              child: Text(valuee),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                labelText: 'Your Name',
                labelStyle: GoogleFonts.abel(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                labelText: 'Your Place',
                labelStyle: GoogleFonts.abel(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                labelText: 'Contact Number',
                labelStyle: GoogleFonts.abel(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 247, 186, 182),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const Dashboard(),
                ),
              );

              MotionToast.success(
                position: MotionToastPosition.top,
                //height: 100,
                // barrierColor: Colors.black,
                description: Text(
                  'Booking Confirmed',
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // primaryColor: Colors.red,
                // icon: Icons.done,
              ).show(context);
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
                      'Confirm Booking',
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
    );
  }
}
