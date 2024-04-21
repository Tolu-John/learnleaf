import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnleaf/core/constants/my_styles.dart';
import 'package:learnleaf/utils/utils_widget.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {


  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: UtilsWidget.courseItem()
    );
    /*
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (ctrl) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: MyStyles.colorPrimary,
                  shape: BoxShape.rectangle,
                ),
                child: ctrl.ilogo,
              ),
            ],
          );
        },
      ),
    );
     */
  }
}
