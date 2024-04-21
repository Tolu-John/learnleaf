import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/app_strings.dart';
import '../core/model/User.dart';
import '../core/service/AuthSv.dart';

import '../core/service/abs/AuthService.dart';
import '../utils/utils_widget.dart';

class AuthController extends GetxController {

  final AuthService _authService;

  AuthController({AuthService? authService}) : _authService = authService ?? AuthSv() ;


  RxBool loading=false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  ////////////////////////

  Future<bool> checkAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(AppStrings.credential) != null) {
      return prefs.getString(AppStrings.credential)!.length > 2 &&
          (prefs.getBool(AppStrings.isAuth) == true)!;
    }
    return false;
  }


  Future<bool> registerUser(AuthType authType, String email,String fullName,String password,String phoneNumber) async {

    loading.value=true;


    IUser iuser = IUser(
      authType: authType,
      fullName: fullName,
      img: "IImageAssets.userPng",
      password: password,
      email: email,
      phone: phoneNumber,
      id: '',
      updatedAt: DateTime.now(),
    );

   bool result=  await _authService.register(iuser);

   loading.value=false;

   return result;
  }

  Future<bool> logOut() async {
    loading.value=true;
    bool result = await _authService.signOut();
    if (result) {
     // Get.offAll(() => ILoginScreen());
      UtilsWidget.successSnack("Log Out Successful");

      loading.value=false;
      return true;

    } else {
      UtilsWidget.errorSnack("Log Out Failed");
    }

    loading.value=false;
    return false;
  }


  Future<bool> signIn(String email, String password) async {

    loading.value=true;

    bool result= await _authService.signIn(email, password);

    loading.value=false;

  return result;
  }

}