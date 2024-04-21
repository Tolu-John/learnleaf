import 'package:learnleaf/core/repository/abs/CourseRepository.dart';

import '../model/course.dart';
import '../repository/local/CourseLocalRepository.dart';
import 'abs/CourseService.dart';

class CourseSv implements CourseService {
  final CourseRepository _courseRepository;

  CourseSv([CourseRepository? courseRepository])
      : _courseRepository = courseRepository ?? CourseLocalRepository();


  @override
  Future<String?> create(Course course) async {
    try {
      return await _courseRepository.create(course);
    } catch (e) {
      throw Exception('Failed to create course: $e');
    }
  }


  @override
  Future<Course> read(String id) async {
    try {
      return await _courseRepository.read(id);
    } catch (e) {
      throw Exception('Failed to get course: $e');
    }
  }

  @override
  Future<List<Course>> getAllCourse() async {
    try {
      return await _courseRepository.readAllCourse();
    } catch (e) {
      throw Exception('Failed to get all courses: $e');
    }
  }

  @override
  Future<int> update(Course course) async {
    try {
      return await _courseRepository.update(course);
    } catch (e) {
      throw Exception('Failed to update course: $e');
    }
  }

  @override
  Future<int> delete(String id) async {
    try {
      return await _courseRepository.delete(id);
    } catch (e) {
      throw Exception('Failed to delete course: $e');
    }
  }
}
