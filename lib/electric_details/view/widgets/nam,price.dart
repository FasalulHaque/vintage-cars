import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class autom extends StatelessWidget {
  autom({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: Column(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: Text(
                    text,
                    //widget.book['cars_name'].toString(),
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
    );
  }
}
