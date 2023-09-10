import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/account_section.dart';
import 'package:mentalhealthapp/pages/categories_section.dart';
import 'package:mentalhealthapp/pages/exercises_section.dart';
import 'package:mentalhealthapp/pages/messages_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _items = [
    const ExercisesSection(),
    const CategoriesSection(),
    const MessagesSection(),
    const AccountSection()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: _currentIndex == 0 ? Colors.blue[600] : Colors.grey[400],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_rounded,
                color: _currentIndex == 1 ? Colors.blue[600] : Colors.grey[400],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                color: _currentIndex == 2 ? Colors.blue[600] : Colors.grey[400],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_sharp,
                color: _currentIndex == 3 ? Colors.blue[600] : Colors.grey[400],
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
