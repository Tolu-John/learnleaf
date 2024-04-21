import 'dart:convert';

import 'package:learnleaf/core/constants/app_strings.dart';
class Review {
   String id;
   String courseId;
   double rating;
   String reviewText;
  DateTime? createdAt;
   DateTime? updatedAt;

  Review({
    required this.id,
    required this.courseId,
    required this.rating,
    required this.reviewText,
    this.createdAt,
     this.updatedAt
  });


  factory Review.fromJson(Map<dynamic, dynamic> json) {
    return Review(
      id: json[AppStrings.id] ,
      courseId: json[AppStrings.courseId] ,
      rating: json[AppStrings.rating],
      reviewText: json[AppStrings.reviewText] ,
      updatedAt: DateTime.parse(json[AppStrings.updatedAt]),
      createdAt: DateTime.parse(json[AppStrings.createdAt]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.id: id,
      AppStrings.courseId: courseId,
      AppStrings.rating: rating,
      AppStrings.reviewText: reviewText,
      AppStrings.updatedAt: updatedAt!.toIso8601String(),
      AppStrings.createdAt: createdAt!.toIso8601String(),
    };
  }


  factory Review.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Review.fromJson(jsonMap);
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
