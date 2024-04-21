
import '../../model/User.dart';

abstract class UserRepository {
  Future<String?> create(IUser user);
  Future<IUser> read(String id);
  Future<List<IUser>> readAllUser();
  Future<int> update(IUser iAccount);
  Future<int> delete(String id);
}