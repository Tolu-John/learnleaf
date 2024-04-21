import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnleaf/controllers/course_controller.dart';
import 'package:learnleaf/utils/utils_widget.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  CourseController courseCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Courses",
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: courseCtrl.courses.value.isNotEmpty
            ? ListView.builder(
                itemCount: courseCtrl.courses.value.length,
                itemBuilder: (context, index) {
                  final course = courseCtrl.courses.value[index];
                  return UtilsWidget.courseItem(course: course);
                },
              )
            : const Center(
                child: Text(
                "No Course Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
