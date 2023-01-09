import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeturedCard extends StatelessWidget {
  FeturedCard(
      {Key? key, required this.text, required this.value, required this.image})
      : super(key: key);

  String text;
  String value;
  Widget image;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 164, 208, 244),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: image),
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
              softWrap: false,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ],
    );
  }
}




// Container(
//               margin: const EdgeInsets.only(top: 40, left: 36, right: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 40,
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 164, 208, 244),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/image/speed-svgrepo-com.svg',
//                           height: 10,
//                           width: 30,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Top Speed',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             '',
//                             // electricAxis['top_speed'].toString(),
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 87,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: const BoxDecoration(
//                               color: Color.fromARGB(255, 164, 208, 244),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             ),
//                             child: SvgPicture.asset(
//                               'assets/image/6043510641641893725.svg',
//                               height: 10,
//                               width: 20,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Fuel Type',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 '',
//                                 // electricAxis['fuel_type'].toString(),
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 20, left: 36, right: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 40,
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 164, 208, 244),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         child: Image.asset(
//                           'assets/image/istockphoto-466542086-612x612-removebg-preview.png',
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Transmission',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             electricAxis['transmission'].toString(),
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 70,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: const BoxDecoration(
//                               color: Color.fromARGB(255, 164, 208, 244),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             ),
//                             child: Image.asset(
//                               'assets/image/number-seats-grey-removebg-preview.png',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Seating',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 electricAxis['seating_capacity'].toString(),
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 20, left: 36, right: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 40,
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 164, 208, 244),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         child: Image.asset(
//                           'assets/image/power-battery-2195871-1887280-removebg-preview.png',
//                           height: 30,
//                           width: 30,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Battery',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             electricAxis['battery_capacity'].toString(),
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 91,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: const BoxDecoration(
//                               color: Color.fromARGB(255, 164, 208, 244),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             ),
//                             child: Image.asset(
//                               'assets/image/rhfg-removebg-preview.png',
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Dr Range',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 electricAxis['driving_range'].toString(),
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 20, left: 36, right: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 40,
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 164, 208, 244),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         child: Image.asset(
//                           'assets/image/4669525-removebg-preview.png',
//                           height: 30,
//                           width: 30,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Safety',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             electricAxis['safety'].toString(),
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
