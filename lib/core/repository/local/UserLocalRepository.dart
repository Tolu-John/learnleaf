import 'package:learnleaf/core/constants/app_strings.dart';
import 'package:sqflite/sqflite.dart';
import '../../database/localDb.dart';
import '../../model/User.dart';
import '../../../utils/utils.dart';
import '../abs/UserRepository.dart';

class UserLocalRepository implements UserRepository {

   @override
  Future<String?> create(IUser user) async {

     final db = await LocalDb.instance.database;

     user.id=Utils.generateUUID();
    user.createdAt= DateTime.now();
    user.updatedAt= DateTime.now();

     await db.insert(AppStrings.user,
         user.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );

   return  user.id;

  }


   @override
  Future<IUser> read(String id) async {
    final db = await LocalDb.instance.database;

    final maps = await db.query(
      AppStrings.user,
      where: '${AppStrings.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return IUser.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }


  @override
  Future<List<IUser>> readAllUser() async {
    final db = await LocalDb.instance.database;

    const orderBy = '${AppStrings.updatedAt} DESC';

    final result = await db.query(AppStrings.user, orderBy: orderBy);

    return result.map((json) => IUser.fromJson(json)).toList();
  }

   @override
  Future<int> update(IUser user) async {
    final db = await LocalDb.instance.database;

    user.updatedAt= DateTime.now();

    return db.update(
      AppStrings.user,
      user.toJson(),
      where: '${AppStrings.id} = ?',
      whereArgs: [user.id],
    );
  }

   @override
  Future<int> delete(String id) async {
    final db = await LocalDb.instance.database;

    return await db.delete(
      AppStrings.user,
      where: '${AppStrings.id} = ?',
      whereArgs: [id],
    );
  }


}
