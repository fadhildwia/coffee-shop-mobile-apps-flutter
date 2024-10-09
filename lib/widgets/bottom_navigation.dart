import 'package:coffee_shop_mobile_apps/utils/index.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: buildSvgIcon(
                'home_outline',
                selectedIndex == 0
                    ? const Color.fromRGBO(198, 124, 78, 1)
                    : const Color.fromRGBO(162, 162, 162, 1),
                selectedIndex == 0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildSvgIcon(
                'heart_outline',
                selectedIndex == 1
                    ? const Color.fromRGBO(198, 124, 78, 1)
                    : const Color.fromRGBO(162, 162, 162, 1),
                selectedIndex == 1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildSvgIcon(
                'cart_outline',
                selectedIndex == 2
                    ? const Color.fromRGBO(198, 124, 78, 1)
                    : const Color.fromRGBO(162, 162, 162, 1),
                selectedIndex == 2,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildSvgIcon(
                'bell_outline',
                selectedIndex == 3
                    ? const Color.fromRGBO(198, 124, 78, 1)
                    : const Color.fromRGBO(162, 162, 162, 1),
                selectedIndex == 3,
              ),
              label: '',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
