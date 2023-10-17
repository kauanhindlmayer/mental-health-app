import 'package:flutter/material.dart';
import 'package:mentalhealthapp/services/functions/exercise_functions.dart';
import 'package:mentalhealthapp/widgets/features/exercises/emoticon_face.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';

class ExercisesSection extends StatelessWidget {
  ExercisesSection({super.key});

  final exerciseService = ExerciseService();

  void _navigateToCreateExercisePage(BuildContext context) {
    Navigator.pushNamed(context, '/create-exercise');
  }

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
                            color: HexColor("#65a3d0"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How do you feel?',
                      style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: HexColor("#FFFFFF"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const EmoticonFace(
                          emoticonFace: '😞',
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Bad',
                          style: TextStyle(
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const EmoticonFace(
                          emoticonFace: '🙂',
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Fine',
                          style: TextStyle(
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const EmoticonFace(
                          emoticonFace: '😃',
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Well',
                          style: TextStyle(
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const EmoticonFace(
                          emoticonFace: '🥳',
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Excellent',
                          style: TextStyle(
                            color: HexColor("#FFFFFF"),
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
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                borderRadius: const BorderRadius.vertical(
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
                      GestureDetector(
                        onTap: () {
                          _navigateToCreateExercisePage(context);
                        },
                        child: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: exerciseService.readExercises(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            'Something went wrong! ${snapshot.error}',
                          );
                        } else if (snapshot.hasData) {
                          final exercises = snapshot.data!;

                          return ListView(
                            children: exercises
                                .map(exerciseService.buildExercise)
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
