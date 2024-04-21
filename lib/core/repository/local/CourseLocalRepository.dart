import 'package:sqflite/sqflite.dart';
import '../../constants/app_strings.dart';
import '../../database/localDb.dart';
import '../../model/User.dart';
import '../../model/course.dart';
import '../../model/review.dart';
import '../../../utils/utils.dart';
import '../abs/CourseRepository.dart';


class CourseLocalRepository implements CourseRepository {
  @override
  Future<String?> create(Course course) async {
    final db = await LocalDb.instance.database;

    course.createdAt = DateTime.now();
    course.updatedAt = DateTime.now();
    course.id = Utils.generateUUID();

    int rowId = await db.insert(
      AppStrings.course,
      course.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rowId > 0 ? course.id : null;
  }

  @override
  Future<Course> read(String id) async {
    
    final db = await LocalDb.instance.database;

    final courseMap = await db.query(
      AppStrings.course,
      where: '${AppStrings.id} = ?',
      whereArgs: [id],
    );

    if (courseMap.isEmpty) {
      throw Exception("no user Found");
    }

    Course course = Course.fromJson(courseMap.first as Map<String, dynamic>);

    final userMap = await db.query(
      AppStrings.user,
      where: '${AppStrings.id} = ?',
      whereArgs: [course.instructorId],
    );

    final reviewListMap = await db.query(
      AppStrings.review,
      where: '${AppStrings.courseId} = ?',
      whereArgs: [course.id],
    );

    if (userMap.isEmpty) {
      throw Exception("no user Found");
    }

    if (reviewListMap.isNotEmpty) {

      course.reviews= reviewListMap.map((json) => Review.fromJson(json)).toList();
    }
    else{

      course.reviews=<Review>[];

    }
    course.instructor = IUser.fromJson(userMap.first as Map<String, dynamic>) as IUser?;

    return course;
  }

  @override
  Future<List<Course>> readAllCourse() async {
    final db = await LocalDb.instance.database;

    List<Course> responseCourseList = [];

    const orderBy = '${AppStrings.updatedAt} DESC';

    final result = await db.query(AppStrings.course, orderBy: orderBy);

    List<Course> courseList = result.map((json) {
      Course course = Course.fromJson(json);
      return course;
    }).toList();

    for (Course course in courseList) {

      final userMap = await db.query(
        AppStrings.user,
        where: '${AppStrings.id} = ?',
        whereArgs: [course.instructorId],
      );


      course.instructor = IUser.fromJson(userMap.first as Map<String, dynamic>) as IUser?;

      final reviewListMap = await db.query(
        AppStrings.review,
        where: '${AppStrings.courseId} = ?',
        whereArgs: [course.id],
      );


      course.reviews= reviewListMap.map((json) => Review.fromJson(json)).toList();
      responseCourseList.add(course);

    }

    return responseCourseList;
  }

  @override
  Future<int> update(Course course) async {
    Database db = await LocalDb.instance.database;

    course.updatedAt = DateTime.now();

    final result = await db.update(
      AppStrings.course,
      course.toJson(),
      where: '${AppStrings.id} = ?',
      whereArgs: [course.id],
    );

    return result;
  }

  @override
  Future<int> delete(String id) async {

    final db = await LocalDb.instance.database;

    int affectedRows = await db.delete(
      AppStrings.course,
      where: '${AppStrings.id} = ?',
      whereArgs: [id],
    );

    return affectedRows;
  }
}
