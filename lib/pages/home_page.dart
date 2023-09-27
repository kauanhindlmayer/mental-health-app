import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/categories_section.dart';
import 'package:mentalhealthapp/utils/exercises_section.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _handleRedirectToMessages(BuildContext context) {
    Navigator.pushNamed(context, '/messages');
  }

  void _handleLogout(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  final List<Widget> _items = [
    const ExercisesSection(),
    const CategoriesSection(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 2:
        _handleRedirectToMessages(context);
        break;
      case 3:
        _handleLogout(context);
        break;
      default:
        setState(() {
          _currentIndex = index;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#267ebd"),
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color:
                    _currentIndex == 0 ? HexColor("#408dc5") : Colors.grey[400],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_rounded,
                color:
                    _currentIndex == 1 ? HexColor("#408dc5") : Colors.grey[400],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                color:
                    _currentIndex == 2 ? HexColor("#408dc5") : Colors.grey[400],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.exit_to_app,
                color:
                    _currentIndex == 3 ? HexColor("#408dc5") : Colors.grey[400],
              ),
              label: '',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
      body: _items.elementAt(_currentIndex),
    );
  }
}
