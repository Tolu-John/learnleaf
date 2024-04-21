
import 'dart:convert';
import 'package:learnleaf/core/constants/app_strings.dart';
import 'package:learnleaf/core/model/review.dart';
import 'package:learnleaf/core/model/User.dart';

class Course {
   String id;
   num price;
   String name;
   String description;
   DateTime startDate;
  DateTime endDate;
  IUser? instructor;
  String instructorId;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Review>? reviews;

   Course({required this.id,required this.name,required this.price, required this.description,required this.startDate,
     required this.endDate, required this.instructor,required this.img, this.createdAt, this.updatedAt})
       : instructorId = instructor!.id ?? "";

   Course.Db({required this.id,required this.name,required this.description,required this.price,required this.startDate,
     required this.endDate, required this.instructorId,required this.img, this.createdAt, this.updatedAt});

  factory Course.fromJson(Map<dynamic, dynamic> json) {
    return Course.Db(
      id: json[AppStrings.id] ,
      name: json[AppStrings.name] ,
      description: json[AppStrings.description] ,
      price: json[AppStrings.price],
      startDate: DateTime.parse(json[AppStrings.startDate]) ,
      endDate: DateTime.parse(json[AppStrings.endDate]) ,
      instructorId: json[AppStrings.instructorId] ,
      img: json[AppStrings.img],
      updatedAt: DateTime.parse(json[AppStrings.updatedAt]),
      createdAt: DateTime.parse(json[AppStrings.createdAt]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.id: id,
      AppStrings.name: name,
      AppStrings.description: description,
      AppStrings.price: price,
      AppStrings.startDate: startDate.toIso8601String(),
      AppStrings.endDate: endDate.toIso8601String(),
      AppStrings.instructorId : instructor!.id,
      AppStrings.img: img,
      AppStrings.updatedAt: updatedAt!.toIso8601String(),
      AppStrings.createdAt: createdAt!.toIso8601String(),
    };
  }


  factory Course.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Course.fromJson(jsonMap);
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
