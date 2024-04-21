import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learnleaf/utils/form_field.dart';

import '../../controllers/review_controller.dart';
import '../../core/model/course.dart';
import '../../core/model/review.dart';

class ReviewFormBottomSheet extends StatefulWidget {
  Course course;

  ReviewFormBottomSheet({super.key, required this.course});

  @override
  State<ReviewFormBottomSheet> createState() => _ReviewFormBottomSheetState();
}

class _ReviewFormBottomSheetState extends State<ReviewFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  ReviewController reviewCtrl = Get.find();

  TextEditingController text= TextEditingController();
  TextEditingController rating= TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.85,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Add New Review',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 8, left: 20, right: 20, bottom: 58),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   FormFields(formLabel: "Review", formHint: "Write review", formController: text),
                    FormFields(formLabel: "Rating", formHint: "Rate Course", formController: rating),
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                                await reviewCtrl.createReview(widget.course.id , double.parse(rating.text.trim()),text.text.trim());
                                Navigator.of(Get.context!).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: const Color(0xFF1F1BF2),
                              minimumSize: const Size(10.0, 44.0)),
                          child:
                          const Text(
                            'Add Review',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

