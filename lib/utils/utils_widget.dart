import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:learnleaf/core/model/User.dart';
import 'package:learnleaf/core/model/course.dart';

class UtilsWidget {
  static errorSnack(String errorMessage) {
    Get.snackbar(
      'Error',
      errorMessage,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  static successSnack(String text) {
    Get.snackbar(
      'Success',
      text,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  static Widget courseItem({Course? course}) {
    IUser? user = course!.instructor;

    return Row(
      children: [
        Column(
          children: [
            Text(
              "Large language Model",
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange.shade400,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        const AssetImage('assets/svg/machine_learning.png')),
                Text(
                  "Tolu Ekujumi",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        SvgPicture.asset("assets/svg/llm.svg", fit: BoxFit.contain),
      ],
    );
  }
}
