import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/course_controller.dart';
import '../../core/model/course.dart';
import '../../utils/form_field.dart';

class CourseBottomSheet extends StatefulWidget {
  Course? course;

  CourseBottomSheet({super.key, this.course});

  @override
  State<CourseBottomSheet> createState() => _CourseBottomSheetState();
}

class _CourseBottomSheetState extends State<CourseBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  CourseController courseCtrl = Get.find();
  late bool isUpdate = false;
  late Course _existingCourse;

  TextEditingController nameCtrl= TextEditingController();
  TextEditingController priceCtrl= TextEditingController();
  TextEditingController descriptionCtrl= TextEditingController();
  TextEditingController = TextEditingController();
  TextEditingController text= TextEditingController();
  TextEditingController rating= TextEditingController();

  String name, num price, String description,DateTime startDate, DateTime endDate, IUser instructor, String img

  @override
  void initState() {
    if (widget.course != null) {
      isUpdate = true;
      _existingCourse = widget.course!;
      nameCtrl.t = _existingCourse.accountNum;
    }
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
                  ISpacer.h30,
                  Expanded(
                    child: Center(
                      child: isUpdate
                          ? Text(
                        'Update Course',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                          : Text(
                        'Add New Course',
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
            IUtilsWidget.ISingleAtmWidget(),
            Container(
              padding: const EdgeInsets.only(
                  top: 8, left: 20, right: 20, bottom: 58),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FormFields(formLabel: "Rating", formHint: "Rate Course", formController: rating),
                    SizedBox(height: 20,),
                    FormFields(formLabel: "Rating", formHint: "Rate Course", formController: rating),
                    SizedBox(height: 20,),
                    FormFields(formLabel: "Rating", formHint: "Rate Course", formController: rating),
                    SizedBox(height: 20,),
                    FormFields(formLabel: "Rating", formHint: "Rate Course", formController: rating),
                    SizedBox(height: 20,),

                    isUpdate
                        ? ISpacer.h5
                        : IAuthInput(
                      hintText: "Course Balance",
                      keyboard: KeyboardType.NUMBER,
                      controller: courseCtrl.balanceCtrl,
                      onSaved: (value) {},
                      onChanged: (val) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter account balance';
                        } else if (RegExp(IConstants.urlDetectorPattern)
                            .hasMatch(value.trim())) {
                          return 'Invalid account balance';
                        }
                        return null;
                      },
                    ),
                    ISpacer.h20,
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (isUpdate) {
                                // Update existing budget
                                _existingCourse.accountNum =
                                    courseCtrl.courseNumCtrl.text;
                                _existingCourse.bankName =
                                    courseCtrl.bankNameCtrl.text;
                                _existingCourse.accountName =
                                    courseCtrl.courseNameCtrl.text;

                                // Call update method of budget controller
                                await courseCtrl.updateCourse(_existingCourse);


                                Navigator.of(Get.context!).pop();

                                FlushBarHelper(Get.context!).showFlushBar(
                                    "Course Updated Successfully",
                                    FlushBarType.success);
                              } else {
                                await courseCtrl.createCourse();

                                Navigator.of(Get.context!).pop();

                                FlushBarHelper(Get.context!).showFlushBar(
                                    "Course Created Successfully",
                                    FlushBarType.success);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: const Color(0xFF1F1BF2),
                              minimumSize: const Size(10.0, 44.0)),
                          child: !isUpdate
                              ? const Text(
                            'Add Course',
                            style: TextStyle(color: Colors.white),
                          )
                              : const Text(
                            'Update Course',
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

