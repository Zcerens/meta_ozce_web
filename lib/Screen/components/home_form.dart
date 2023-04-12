import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta_ozce_0/Screen/AnaEkran/anaEkran.dart';
import 'package:meta_ozce_0/Screen/Personeller/personeller.dart';
import 'package:meta_ozce_0/const/constant.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({Key? key}) : super(key: key);

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  int _selectedIndex = 0;

  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "category": "Ahmet Karaman"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Kerem Dadak"},
    {"icon": FontAwesomeIcons.hand, "category": "Mehmet Sakin"},
    {"icon": FontAwesomeIcons.lungs, "category": "Ayşe Yenilmez"}
  ];
  List<dynamic> tumGorevler = [
    {"icerik": "Oda 1 temizlenecek", "kod": "0"},
    {"icerik": "Oda 2 temizlenecek", "kod": "1"}
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      AnaEkran(),
      ikinciEkran(),
      Personeller(),
      dorduncuEkran(),
    ];
    return Scaffold(
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
            extended: isExpanded,
            backgroundColor: Colors.deepPurple.shade400,
            unselectedIconTheme:
                const IconThemeData(color: Colors.white, opacity: 1),
            unselectedLabelTextStyle: const TextStyle(
              color: Colors.white,
            ),
            selectedIconTheme: IconThemeData(color: kPrimaryBackColor),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                label: Text("Personel Yönetimi"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Profile"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text("Settings"),
              ),
            ],
          ),
          screens[_selectedIndex],
        ],
      ),
    );
  }

  Widget ikinciEkran() => Container(
        child: const Text("2.ekran"),
      );

  Widget dorduncuEkran() => Container(
        child: const Text("4.ekran"),
      );
}
