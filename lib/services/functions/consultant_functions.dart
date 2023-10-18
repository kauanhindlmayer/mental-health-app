import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentalhealthapp/services/models/consultant.dart';
import 'package:mentalhealthapp/utils/hex_color.dart';
import 'package:mentalhealthapp/widgets/global/default_tile.dart';

class ConsultantService {
  Future create(Consultant consultant) async {
    final docConsultant =
        FirebaseFirestore.instance.collection('consultants').doc();
    consultant.id = docConsultant.id;
    final json = consultant.toJson();
    await docConsultant.set(json);
  }

  Widget buildConsultant(Consultant consultant) {
    return DefaultTile(
      icon: Icons.person,
      color: HexColor(consultant.color),
      title: consultant.fullName,
      subTitle: consultant.categoryName,
      actionDelete: () => delete(consultant),
      actionUpdate: (context) => Navigator.pushNamed(
        context,
        '/consultant-formulary',
        arguments: consultant.id,
      ),
    );
  }

  Stream<List<Consultant>> findAll() => FirebaseFirestore.instance
      .collection('consultants')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Consultant.fromJson(doc.data())).toList());

  Future delete(Consultant consultant) async {
    await FirebaseFirestore.instance
        .collection('consultants')
        .doc(consultant.id)
        .delete();
  }

  Future update(Consultant consultant) async {
    await FirebaseFirestore.instance
        .collection('consultants')
        .doc(consultant.id)
        .update(consultant.toJson());
  }

  Future<Consultant> findById(String id) async {
    final docConsultant = await FirebaseFirestore.instance
        .collection('consultants')
        .doc(id)
        .get();
    return Consultant.fromJson(docConsultant.data() ?? {});
  }
}
