import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/emoticon_face.dart';
import 'package:mentalhealthapp/utils/default_tile.dart';

class ExercisesSection extends StatelessWidget {
  const ExercisesSection({super.key});

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
                        const Text(
                          'Hi, Jared!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '7 Sep, 2023',
                          style: TextStyle(color: Colors.blue[200]),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
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
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
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
                          style: TextStyle(color: Colors.white),
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
                          style: TextStyle(color: Colors.white),
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
                          style: TextStyle(color: Colors.white),
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
                          style: TextStyle(color: Colors.white),
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
                color: Colors.grey[200],
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
                        'Exercises',
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
                  Expanded(
                    child: ListView(
                      children: const [
                        DefaultTile(
                          icon: Icons.speaker_notes,
                          color: Colors.orange,
                          title: 'Speaking Skills',
                          subTitle: '16 exercises',
                        ),
                        DefaultTile(
                          icon: Icons.person,
                          color: Colors.blue,
                          title: 'Reading Speed',
                          subTitle: '6 exercises',
                        ),
                        DefaultTile(
                          icon: Icons.favorite,
                          color: Colors.pink,
                          title: 'Breathing Exercise',
                          subTitle: '5 min',
                        ),
                        DefaultTile(
                          icon: Icons.running_with_errors_rounded,
                          color: Colors.green,
                          title: 'Running Exercise',
                          subTitle: '10 min',
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
