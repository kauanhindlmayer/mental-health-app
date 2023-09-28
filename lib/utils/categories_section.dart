import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/category.dart';
import 'package:mentalhealthapp/utils/default_tile.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 25.0,
              right: 25.0,
              bottom: 0.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Jared!',
                          style: TextStyle(
                            color: HexColor("#FFFFFF"),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '7 Sep, 2023',
                          style: TextStyle(
                            color: HexColor("#65A3D0"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor("#408dc5"),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.notifications,
                        color: HexColor("#FFFFFF"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor("#408dc5"),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: HexColor("#FFFFFF"),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: HexColor("#FFFFFF"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Category(
                                color: HexColor("#9E6AF4"),
                                title: 'Relationship',
                              ),
                              const SizedBox(height: 16.0),
                              Category(
                                color: HexColor("#FF9060"),
                                title: 'Education',
                              ),
                            ],
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            children: [
                              Category(
                                color: HexColor("#267ebd"),
                                title: 'Career',
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Category(
                                color: HexColor("#EF4F72"),
                                title: 'Other',
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Consultant',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        DefaultTile(
                          icon: Icons.person,
                          color: HexColor("78B7A3"),
                          title: 'Bobby Singer',
                          subTitle: 'Education',
                        ),
                        DefaultTile(
                          icon: Icons.person,
                          color: HexColor("#B486F8"),
                          title: 'Dean Winchester',
                          subTitle: 'Career',
                        ),
                        DefaultTile(
                          icon: Icons.person,
                          color: HexColor("#2C80BF"),
                          title: 'Sam Winchester',
                          subTitle: 'Relationship',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
