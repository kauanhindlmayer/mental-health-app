import 'package:flutter/material.dart';
import 'package:mentalhealthapp/services/functions/consultant_functions.dart';
import 'package:mentalhealthapp/services/models/consultant.dart';
import 'package:mentalhealthapp/utils/colors.dart';

class ConsultantFormularyPage extends StatelessWidget {
  ConsultantFormularyPage({super.key});

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final consultantService = ConsultantService();

  @override
  Widget build(BuildContext context) {
    final consultantId = ModalRoute.of(context)?.settings.arguments as String?;

    if (consultantId != null) {
      consultantService.findById(consultantId).then((consultant) {
        titleController.text = consultant.fullName;
        subtitleController.text = consultant.categoryName;
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
                          _navigateToHomePage(context);
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[200]!,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: titleController,
                                  decoration: const InputDecoration(
                                    hintText: "Title",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[200]!,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: subtitleController,
                                  decoration: const InputDecoration(
                                    hintText: "Description",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            final consultant = Consultant(
                              id: '',
                              fullName: titleController.text,
                              categoryName: subtitleController.text,
                              color: "#2C80BF",
                            );

                            if (consultantId == null) {
                              consultantService.create(consultant);
                            } else {
                              consultant.id = consultantId;
                              consultantService.update(consultant);
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