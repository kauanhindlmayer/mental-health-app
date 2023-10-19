import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/exercises/components/emoticon_face.dart';
import 'package:mentalhealthapp/services/exercise_service.dart';
import 'package:mentalhealthapp/utils/colors.dart';

class ExercisesSection extends StatelessWidget {
  ExercisesSection({super.key});

  final _exerciseService = ExerciseService();

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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Jared!',
                          style: TextStyle(
                            color: MyColors.primary_white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '7 Sep, 2023',
                          style: TextStyle(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How do you feel?',
                      style: TextStyle(
                        color: MyColors.primary_white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: MyColors.primary_white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: '😞',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Bad',
                          style: TextStyle(
                            color: MyColors.primary_white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: '🙂',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Fine',
                          style: TextStyle(
                            color: MyColors.primary_white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: '😃',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Well',
                          style: TextStyle(
                            color: MyColors.primary_white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: '🥳',
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Excellent',
                          style: TextStyle(
                            color: MyColors.primary_white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25.0,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Exercises',
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
                            Navigator.pushNamed(context, '/exercise-formulary');
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
                      stream: _exerciseService.findAll(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            'Something went wrong! ${snapshot.error}',
                          );
                        } else if (snapshot.hasData) {
                          final exercises = snapshot.data!;

                          return ListView(
                            children: exercises
                                .map(_exerciseService.buildExercise)
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
