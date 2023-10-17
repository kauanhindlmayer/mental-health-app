import 'package:flutter/material.dart';
import 'package:mentalhealthapp/widgets/features/categories/categories_section.dart';
import 'package:mentalhealthapp/widgets/features/exercises/exercises_section.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _navigateToMessagesPage(BuildContext context) {
    Navigator.pushNamed(context, '/messages');
  }

  void _handleLogout(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  final List<Widget> _items = [
    ExercisesSection(),
    const CategoriesSection(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 2:
        _navigateToMessagesPage(context);
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
          backgroundColor: HexColor("#FFFFFF"),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: _currentIndex == 0
                    ? HexColor("#408dc5")
                    : HexColor("#CBD8F5"),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_rounded,
                color: _currentIndex == 1
                    ? HexColor("#408dc5")
                    : HexColor("#CBD8F5"),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                color: _currentIndex == 2
                    ? HexColor("#408dc5")
                    : HexColor("#CBD8F5"),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.exit_to_app_outlined,
                color: _currentIndex == 3
                    ? HexColor("#408dc5")
                    : HexColor("#CBD8F5"),
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
