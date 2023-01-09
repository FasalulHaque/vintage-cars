import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars/drawer/view/settings.dart';
import 'package:vintagecars/electric_car/view/electric.dart';
import 'package:vintagecars/used_car/view/used_car.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).unfocus();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
            child: UserAccountsDrawerHeader(
              accountName: const Text('Fasalul Haque'),
              accountEmail: const Text('Fasalulhaque@gmail.com'),
              currentAccountPictureSize: const Size.square(100),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/images (1).png',
                      fit: BoxFit.cover,
                      width: 80,
                      height: 110,
                    ),
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image/hinh-nen-background.png.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(
              'Favorite',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.car),
          //   title: Text(
          //     'Electric Car',
          //     style: GoogleFonts.adamina(color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
          // const SizedBox(
          //   height: 9,
          // ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.car),
          //   title: Text(
          //     'Used car',
          //     style: GoogleFonts.adamina(color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
          // const SizedBox(
          //   height: 9,
          // ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: Text(
              'Profile',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute<dynamic>(builder: (context) => (context) => p,))
            },
          ),
          // const SizedBox(
          //   height: 9,
          // ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: Text(
          //     'Orders ',
          //     style: GoogleFonts.adamina(color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: Text(
              'Share',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '7',
                    style: GoogleFonts.adamina(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    // TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Settings',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Logout',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
