import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/model/User.dart';
import '../core/service/UserSv.dart';
import '../core/service/abs/IUserService.dart';

class UserController extends GetxController {
  RxList<IUser> users = <IUser>[].obs;
  var loading = false.obs;

  final UserService _userService;

  UserController({UserService? userService}) : _userService = userService ?? UserSv() ;
  

  @override
  void onInit() {
    fetchAllUsers();
    super.onInit();
  }


  Future<void> fetchAllUsers() async {
    try {
      loading.value = true;

      List<IUser>? fetchedUsers = await _userService.getAllUser();

      users.assignAll(fetchedUsers!);
    } catch (e) {

      print('Error fetching users: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<IUser?> readUser() async {
    try {
      loading.value = true;
      return await _userService.read("");

    } catch (e) {

      print('Error fetching users: $e');
    } finally {
      loading.value = false;
    }
  }


  Future<void> deleteUser(IUser user) async {
    try {
      loading.value = true;


      if(user.id!=null){
        await _userService.delete(user.id!);
        users.remove(user);
      }

    } catch (e) {

      print('Error deleting user: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateUser( IUser updatedUser) async {
    try {
      loading.value = true;

      await _userService.update(updatedUser);
    } catch (e) {
      print('Error updating user: $e');
    } finally {
      loading.value = false;
    }
  }


}
