
import 'package:learnleaf/core/constants/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/User.dart';
import '../../../utils/utils.dart';
import '../abs/AuthRepository.dart';
import 'UserLocalRepository.dart';


class AuthLocalRepository implements AuthRepository {
  UserLocalRepository userLocalRepository = UserLocalRepository();

  @override
  Future<bool> register(IUser user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    user.password = Utils().encryptPassword(user.password)!;
    String? id = await userLocalRepository.create(user);

    bool isAuth= id != null && id.length > 1;

    if(isAuth){
      await prefs.setString(AppStrings.credential, id);
      await prefs.setBool(AppStrings.isAuth, true);
    }

    return isAuth;
  }

  @override
  Future<bool> signIn(String email, String password) async {

    bool isAuth=false;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<IUser> iUsers = await userLocalRepository.readAllUser();

    if(iUsers.isNotEmpty) {

      bool isAuth= iUsers.first.password == Utils().encryptPassword(password) && iUsers.first.email == email;

      if (isAuth) {
        await prefs.setString(AppStrings.credential, iUsers.first.id!);
        await prefs.setBool(AppStrings.isAuth, true);
      }
    }

    return isAuth;

  }

  @override
  Future<bool> signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (
    prefs.getString(AppStrings.credential)!= null
        && prefs.getBool(AppStrings.isAuth)!
    ) {
     await prefs.remove(AppStrings.credential);
     await prefs.setBool(AppStrings.isAuth, false);
     return true;
    }

    return false;
  }

  @override
  Future<bool> forgotPassword(String email) {
    throw UnimplementedError();
  }
}
