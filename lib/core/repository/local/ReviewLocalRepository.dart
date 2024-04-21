import 'dart:convert';
import 'package:sqflite/sqflite.dart';

import '../../constants/app_strings.dart';
import '../../database/localDb.dart';
import '../../model/review.dart';
import '../../../utils/utils.dart';
import '../abs/ReviewRepository.dart';




class ReviewLocalRepository implements ReviewRepository {
  @override
  Future<String?> create(Review review) async {
    final db = await LocalDb.instance.database;

    review.createdAt = DateTime.now();
    review.updatedAt = DateTime.now();
    review.id = Utils.generateUUID();

    int rowId = await db.insert(
      AppStrings.review,
      review.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rowId > 0 ? review.id : null;
  }

  @override
  Future<Review> read(String id) async {
    final db = await LocalDb.instance.database;

    final reviewMap = await db.query(
      AppStrings.review,
      where: '${AppStrings.id} = ?',
      whereArgs: [id],
    );

    if (reviewMap.isEmpty) {
      throw Exception("no review Found");
    }

    Review review = Review.fromJson(reviewMap.first as Map<String, dynamic>);

    return review;
  }

  @override
  Future<List<Review>> readAllReview() async {
    final db = await LocalDb.instance.database;

    List<Review> responseReviewList = [];

    const orderBy = '${AppStrings.updatedAt} DESC';

    final result = await db.query(AppStrings.review, orderBy: orderBy);

    List<Review> reviewList = result.map((json) {
      Review review = Review.fromJson(json);
      return review;
    }).toList();

    return reviewList;
  }

  @override
  Future<int> update(Review review) async {
    Database db = await LocalDb.instance.database;

    review.updatedAt = DateTime.now();

    final result = await db.update(
      AppStrings.review,
      review.toJson(),
      where: '${AppStrings.id} = ?',
      whereArgs: [review.id],
    );

    return result;
  }

  @override
  Future<int> delete(String id) async {
    final db = await LocalDb.instance.database;

    int affectedRows = await db.delete(
      AppStrings.review,
      where: '${AppStrings.id} = ?',
      whereArgs: [id],
    );

    return affectedRows;
  }
}
