import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vintagecars/drawer/view/drawer.dart';
import 'package:vintagecars/electric_car/view/electric.dart';
import 'package:vintagecars/favorite/view/favorite.dart';
import 'package:vintagecars/used_car/view/used_car.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;

  void _onltemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _widgets = [
    ElectricCar(),
    const FavoriteScreen(),
    UsedCar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: appBarText()),
      backgroundColor: Colors.deepPurple,
      body: _widgets.elementAt(_selectedindex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
        animationDuration: const Duration(microseconds: 300),
        height: 60,
        items: const [
          Icon(
            FontAwesomeIcons.car,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.car,
            color: Colors.white,
          ),
        ],
        index: _selectedindex,
        onTap: _onltemTapped,
      ),
    );
  }

  Text appBarText() {
    switch (_selectedindex) {
      case 0:
        return Text('Electric');
      case 1:
        return Text('Favourite');
      case 2:
        return Text('Used cars');

      default:
        return Text('Cars');
    }
  }
}
