import 'package:coffee_shop_mobile_apps/utils/index.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Tab')),
    const Center(child: Text('Wishlist Tab')),
    const Center(child: Text('Cart Tab')),
    const Center(child: Text('Notification Tab')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
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
              offset: Offset(0, -1),
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
                    _selectedIndex == 0
                        ? const Color.fromRGBO(198, 124, 78, 1)
                        : const Color.fromRGBO(162, 162, 162, 1),
                    _selectedIndex == 0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: buildSvgIcon(
                    'heart_outline',
                    _selectedIndex == 1
                        ? const Color.fromRGBO(198, 124, 78, 1)
                        : const Color.fromRGBO(162, 162, 162, 1),
                    _selectedIndex == 1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: buildSvgIcon(
                    'cart_outline',
                    _selectedIndex == 2
                        ? const Color.fromRGBO(198, 124, 78, 1)
                        : const Color.fromRGBO(162, 162, 162, 1),
                    _selectedIndex == 2),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: buildSvgIcon(
                    'bell_outline',
                    _selectedIndex == 3
                        ? const Color.fromRGBO(198, 124, 78, 1)
                        : const Color.fromRGBO(162, 162, 162, 1),
                    _selectedIndex == 3),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
