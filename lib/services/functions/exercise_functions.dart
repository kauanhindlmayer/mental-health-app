import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthapp/services/models/exercise.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';
import 'package:mentalhealthapp/widgets/global/default_tile.dart';

class ExerciseService {
  Future createExercise(Exercise exercise) async {
    final docExercise =
        FirebaseFirestore.instance.collection('exercises').doc();
    exercise.id = docExercise.id;
    final json = exercise.toJson();
    await docExercise.set(json);
  }

  Widget buildExercise(Exercise exercise) {
    final Map<String, IconData> iconMapping = {
      'running_with_errors_rounded': Icons.running_with_errors_rounded,
      'favorite': Icons.favorite,
      'person': Icons.person,
      'speaker_notes': Icons.speaker_notes,
      'fitness_center': Icons.fitness_center,
    };

    IconData iconData = iconMapping[exercise.icon] ?? Icons.message;

    return DefaultTile(
      icon: iconData,
      color: HexColor(exercise.color),
      title: exercise.title,
      subTitle: exercise.subtitle,
      actionDelete: () => deleteExercise(exercise),
      itemId: exercise.id,
      redirectToPath: '/create-exercise',
    );
  }

  Stream<List<Exercise>> readExercises() => FirebaseFirestore.instance
      .collection('exercises')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Exercise.fromJson(doc.data())).toList());

  Future deleteExercise(Exercise exercise) async {
    await FirebaseFirestore.instance
        .collection('exercises')
        .doc(exercise.id)
        .delete();
  }

  Future updateExercise(Exercise exercise) async {
    await FirebaseFirestore.instance
        .collection('exercises')
        .doc(exercise.id)
        .update(exercise.toJson());
  }

  Future<Exercise> getExerciseById(String id) async {
    final docExercise =
        await FirebaseFirestore.instance.collection('exercises').doc(id).get();
    return Exercise.fromJson(docExercise.data() ?? {});
  }
}
