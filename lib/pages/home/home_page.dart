import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/consultants/consultants_section.dart';
import 'package:mentalhealthapp/utils/colors.dart';
import 'package:mentalhealthapp/pages/exercises/exercises_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _handleLogout(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  final List<Widget> _items = [
    ExercisesSection(),
    CategoriesSection(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 2:
        Navigator.pushNamed(context, '/messages');
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
      backgroundColor: MyColors.primary_blue,
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: BottomNavigationBar(
          backgroundColor: MyColors.primary_white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: _currentIndex == 0
                    ? MyColors.secondary_blue
                    : MyColors.quaternary_blue,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_rounded,
                color: _currentIndex == 1
                    ? MyColors.secondary_blue
                    : MyColors.quaternary_blue,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                color: _currentIndex == 2
                    ? MyColors.secondary_blue
                    : MyColors.quaternary_blue,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.exit_to_app_outlined,
                color: _currentIndex == 3
                    ? MyColors.secondary_blue
                    : MyColors.quaternary_blue,
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
