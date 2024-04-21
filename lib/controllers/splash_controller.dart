import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SplashController extends GetxController{


  // var visible = true;
  final String assetName = "IImageAssets.logoPng2";
  late Widget ilogo ;
  late AnimationController animationController;
  late Animation<double> animation;
  AuthController authController=Get.find();

  

  @override
  void onInit() {
    //iUserSv= IUserSv();
    initializeAnimation();
    startTimeOut();
    super.onInit();
  }

  void initializeAnimation(){
    ilogo = Center(child: Image.asset(assetName));
  }

  navigationPage() async {
    bool isAuthenticated= await authController.checkAuth();
    if (isAuthenticated) {
   //   Get.off(() =>  IHomeScreen());
    } else {
    //  Get.off(() =>  IOnboardingScreen());
    }
  }





  startTimeOut() {
    var duration =  const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }
}