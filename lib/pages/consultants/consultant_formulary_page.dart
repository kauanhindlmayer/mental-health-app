import 'package:flutter/material.dart';
import 'package:mentalhealthapp/components/form_container_widget.dart';
import 'package:mentalhealthapp/models/consultant.dart';
import 'package:mentalhealthapp/services/consultant_service.dart';
import 'package:mentalhealthapp/utils/colors.dart';

class ConsultantFormularyPage extends StatelessWidget {
  ConsultantFormularyPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _consultantService = ConsultantService();

  @override
  Widget build(BuildContext context) {
    final consultantId = ModalRoute.of(context)?.settings.arguments as String?;

    if (consultantId != null) {
      _consultantService.findById(consultantId).then((consultant) {
        _titleController.text = consultant.fullName;
        _subtitleController.text = consultant.categoryName;
      });
    }

    return Scaffold(
      backgroundColor: MyColors.primary_blue,
      body: SafeArea(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.secondary_blue,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Icon(
                            Icons.arrow_back,
                            color: MyColors.primary_white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${consultantId == null ? 'Create' : 'Update'} Consultant',
                            style: const TextStyle(
                              color: MyColors.primary_white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25.0,
                      )
                    ],
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
                  color: MyColors.primary_white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.primary_white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                FormContainerWidget(
                                  controller: _titleController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your title';
                                    }
                                    return null;
                                  },
                                  hintText: "Title",
                                ),
                                FormContainerWidget(
                                  controller: _subtitleController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your subtitle';
                                    }
                                    return null;
                                  },
                                  hintText: "Description",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!_formKey.currentState!.validate()) return;

                            final consultant = Consultant(
                              id: '',
                              fullName: _titleController.text,
                              categoryName: _subtitleController.text,
                              color: "#2C80BF",
                            );

                            if (consultantId == null) {
                              _consultantService.create(consultant);
                            } else {
                              consultant.id = consultantId;
                              _consultantService.update(consultant);
                            }

                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyColors.primary_blue,
                            ),
                            child: Center(
                              child: Text(
                                consultantId == null ? 'Create' : 'Update',
                                style: const TextStyle(
                                  color: MyColors.primary_white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
