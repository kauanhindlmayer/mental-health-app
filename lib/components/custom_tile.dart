import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/colors.dart';

class CustomTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function actionDelete;
  final Function actionUpdate;
  final String title;
  final String subTitle;

  const CustomTile({
    super.key,
    required this.icon,
    required this.color,
    required this.actionDelete,
    required this.actionUpdate,
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
          color: MyColors.primary_white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: MyColors.primary_black,
          ),
          boxShadow: const [
            BoxShadow(
              color: MyColors.primary_black,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
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
                      color: MyColors.primary_white,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.secondary_gray,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              onSelected: (String choice) {
                if (choice == 'Edit') {
                  actionUpdate(context);
                } else if (choice == 'Delete') {
                  actionDelete();
                }
              },
              itemBuilder: (BuildContext context) {
                return ['Edit', 'Delete'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
