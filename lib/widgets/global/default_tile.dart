import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class DefaultTile extends StatelessWidget {
  final icon;
  final color;
  final String title;
  final String subTitle;

  const DefaultTile({
    super.key,
    this.icon,
    this.color,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: HexColor("#FFFFFF"),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: HexColor("#CCCCCC").withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: HexColor("#CCCCCC").withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: color,
                    child: Icon(
                      icon,
                      color: HexColor("#FFFFFF"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor("#CCCCCC"),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.more_horiz,
            ),
          ],
        ),
      ),
    );
  }
}
