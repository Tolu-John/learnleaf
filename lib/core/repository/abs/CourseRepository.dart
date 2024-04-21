
import '../../model/course.dart';

abstract class CourseRepository {
  Future<String?> create(Course course);
  Future<Course> read(String id);
  Future<List<Course>> readAllCourse();
  Future<int> update(Course course);
  Future<int> delete(String id);
}