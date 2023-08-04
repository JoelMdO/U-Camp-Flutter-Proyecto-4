import 'package:flutter/material.dart';
import 'package:proyecto4_bola8/utils/colors.dart';

class NavigationBottonBar extends StatelessWidget {
  const NavigationBottonBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colores.greenblue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage(
                'assets/letsconnect.png',
              )),
              label: ''),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/Envelope.png')), label: ''),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/GitHub.png')),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (selectedIndex) async {
// Handle navigation based on the index and direct to email or github
          if (selectedIndex == 0) {
          } else if (selectedIndex == 1) {
          } else if (selectedIndex == 2) {}
        });
  }
}
