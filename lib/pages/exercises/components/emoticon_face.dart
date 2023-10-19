import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/colors.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticonFace;

  const EmoticonFace({super.key, required this.emoticonFace});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.secondary_blue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Text(
          emoticonFace,
          style: const TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}
