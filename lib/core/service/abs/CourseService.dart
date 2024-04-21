import '../../model/course.dart';

abstract class CourseService {
  Future<String?> create(Course course);
  Future<Course> read(String id);
  Future<List<Course>> getAllCourse();
  Future<int> update(Course course);
  Future<int> delete(String id);
}