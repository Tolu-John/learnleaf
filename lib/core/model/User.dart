import 'dart:convert';

import '../constants/app_strings.dart';

enum AuthType { admin, standard }

class IUser {
  String id;
  String fullName;
  String email;
  String phone;
  String password;
  AuthType authType;
  String? img;
  DateTime? createdAt;
  late DateTime updatedAt;

  IUser(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.authType,
      required this.password,
      required this.img,
      this.createdAt,
      required this.updatedAt});

  factory IUser.fromJson(Map<dynamic, dynamic> json) {
    return IUser(
      id: json[AppStrings.id],
      fullName: json[AppStrings.fullName],
      email: json[AppStrings.email],
      phone: json[AppStrings.phone],
      authType: json[AppStrings.authType] == "ADMIN"
          ? AuthType.admin
          : AuthType.standard,
      password: json[AppStrings.password],
      img: json[AppStrings.img],
      updatedAt: DateTime.parse(json[AppStrings.updatedAt]),
      createdAt: DateTime.parse(json[AppStrings.createdAt]),
    );

  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.id: id,
      AppStrings.fullName: fullName,
      AppStrings.email: email,
      AppStrings.phone: phone,
      AppStrings.password: password,
      AppStrings.authType: authType == AuthType.admin ? "ADMIN" : "STANDARD",
      AppStrings.img: img,
      AppStrings.updatedAt: updatedAt.toIso8601String(),
      AppStrings.createdAt: createdAt!.toIso8601String(),
    };
  }

  factory IUser.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return IUser.fromJson(jsonMap);
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
