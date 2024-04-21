import '../../model/User.dart';

abstract class UserService {


  Future<String?> create(IUser iUser);

  Future<IUser?> read(String id);

  Future<List<IUser>?> getAllUser();

  Future<int> update(IUser iUser);

  Future<int> delete(String id);

}