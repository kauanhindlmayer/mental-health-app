import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Color color;
  final String title;

  const Category({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    // Create a pastel shade color by reducing the opacity of the provided color
    Color pastelColor = color.withOpacity(0.8);

    return InkWell(
      onTap: () {
        // Add your onTap functionality here
        // This will trigger the ripple effect
      },
      child: Container(
        width: 150.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: pastelColor, // Use the pastel shade color
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.6), // Light effect color
              spreadRadius: 2,
              blurRadius: 5,
              offset:
                  const Offset(0, 3), // Adjust the shadow position as needed
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
