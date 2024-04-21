import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnleaf/controllers/auth_controller.dart';
import 'package:learnleaf/screens/splash_screen.dart';
import 'controllers/course_controller.dart';
import 'controllers/review_controller.dart';
import 'controllers/user_controller.dart';
import 'core/model/course.dart';
import 'core/model/review.dart';
import 'core/service/CourseSv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.put(()=> UserController());
    Get.put(()=> AuthController());
    Get.put(()=> CourseController());
    Get.put(()=> ReviewController());


    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}





