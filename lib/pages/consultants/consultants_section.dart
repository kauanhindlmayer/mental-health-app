import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentalhealthapp/pages/consultants/components/category.dart';
import 'package:mentalhealthapp/services/consultant_service.dart';
import 'package:mentalhealthapp/services/firebase_auth_service.dart';
import 'package:mentalhealthapp/utils/colors.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});

  final _consultantService = ConsultantService();
  final displayName = FirebaseAuthService().currentUser?.displayName ?? '';
  final formattedDate = DateFormat('d MMM, y').format(DateTime.now());

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
                          'Hi, $displayName',
                          style: const TextStyle(
                            color: MyColors.primary_white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: MyColors.tertiary_blue,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.secondary_blue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: const Icon(
                        Icons.notifications,
                        color: MyColors.primary_white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.secondary_blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: MyColors.primary_white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: MyColors.primary_white,
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
              decoration: const BoxDecoration(
                color: MyColors.primary_white,
                borderRadius: BorderRadius.vertical(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Category(
                                color: MyColors.relationship_category,
                                title: 'Relationship',
                              ),
                              SizedBox(height: 16.0),
                              Category(
                                color: MyColors.education_category,
                                title: 'Education',
                              ),
                            ],
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            children: [
                              Category(
                                color: MyColors.career_category,
                                title: 'Career',
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Category(
                                color: MyColors.other_category,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Consultant',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_horiz),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        onSelected: (String choice) {
                          if (choice == 'Create') {
                            Navigator.pushNamed(
                              context,
                              '/consultant-formulary',
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return ['Create'].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: _consultantService.findAll(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            'Something went wrong! ${snapshot.error}',
                          );
                        } else if (snapshot.hasData) {
                          final consultants = snapshot.data!;

                          return ListView(
                            children: consultants
                                .map(_consultantService.buildConsultant)
                                .toList(),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
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
