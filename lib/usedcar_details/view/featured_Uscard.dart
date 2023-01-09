import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeturedUsedCard extends StatelessWidget {
  FeturedUsedCard({
    Key? key,
    required this.text,
    required this.value,
    required this.image,
  }) : super(key: key);

  String text;
  String value;
  Widget image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 164, 208, 244),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: 
            image,
            
            //fit: BoxFit.cover,
          
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
