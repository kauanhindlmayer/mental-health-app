import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class Category extends StatelessWidget {
  final Color color;
  final String title;

  const Category({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    Color pastelColor = color.withOpacity(0.8);

    return InkWell(
      onTap: () {},
      child: Container(
        width: 150.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: pastelColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: HexColor("#FFFFFF").withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: HexColor("#FFFFFF"),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
