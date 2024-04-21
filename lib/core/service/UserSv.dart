import '../model/User.dart';
import '../repository/abs/UserRepository.dart';
import '../repository/local/UserLocalRepository.dart';
import 'abs/IUserService.dart';


class UserSv implements UserService {
  final UserRepository _userRepository;

  UserSv([UserRepository? userRepository])
      : _userRepository = userRepository ?? UserLocalRepository(); // Providing default implementation

  @override
  Future<String?> create(IUser user) async {
    try {
      return await _userRepository.create(user);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<IUser?> read(String id) async {
    try {
      return await _userRepository.read(id);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  @override
  Future<List<IUser>?> getAllUser() async {
    try {
      return await _userRepository.readAllUser();
    } catch (e) {
      throw Exception('Failed to get all users: $e');
    }
  }

  @override
  Future<int> update(IUser user) async {
    try {
      return await _userRepository.update(user);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  @override
  Future<int> delete(String id) async {
    try {
      return await _userRepository.delete(id);
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

}
