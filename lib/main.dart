import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/review_controller.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ReviewController _reviewController = Get.put(ReviewController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}





