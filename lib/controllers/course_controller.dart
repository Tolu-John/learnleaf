import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/app_strings.dart';
import '../core/model/User.dart';
import '../core/model/course.dart';
import '../core/service/CourseSv.dart';
import '../core/service/abs/CourseService.dart';

class CourseController extends GetxController {

  RxList<Course> courses = <Course>[].obs;
  var loading = false.obs;
  
  final CourseService _courseService;

  CourseController({CourseService? courseService}) : _courseService = courseService ?? CourseSv() ;


  @override
  void onInit() {
    fetchAllCourses();
    super.onInit();
  }

  Future<void> fetchAllCourses() async {
    try {
      loading.value = true;
      
      List<Course> fetchedCourses = await _courseService.getAllCourse();
     
      courses.assignAll(fetchedCourses);
    } catch (e) {
      
      print('Error fetching courses: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> createCourse(String name, num price, String description,DateTime startDate, DateTime endDate, IUser instructor, String img) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getString(AppStrings.credential);

    try {
      loading.value = true;

      var course = Course(
          id: " ",
          name: name,
          price: price,
          description: description,
          startDate: startDate,
          endDate: endDate,
          instructor: instructor,
          img: img,
      );


      String? id = await _courseService.create(course);

      Course newCourse = await _courseService.read(id!);
      courses.add(newCourse);

    } catch (e) {

      print('Error creating course: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteCourse(Course course) async {
    try {
      loading.value = true;

      if(course.id!=null){
        await _courseService.delete(course.id!);

        courses.remove(course);
      }

    } catch (e) {
      print('Error deleting course: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateCourse(Course updatedCourse) async {
    try {
      loading.value = true;


      await _courseService.update(updatedCourse);


      int index = courses.indexWhere((course) {

        return course.id == updatedCourse.id;

      });
      print('Index of updated course in the list: $index');


      if (index != -1) {
        courses[index] = updatedCourse;
        print('Course updated in the local list.');
      } else {
        print('Course not found in the local list.');
      }

      await fetchAllCourses();

    } catch (e) {
      print('Error updating course: $e');
    } finally {
      loading.value = false;
    }
  }
}
