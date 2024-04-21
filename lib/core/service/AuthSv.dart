

import '../model/User.dart';
import '../repository/abs/AuthRepository.dart';
import '../repository/local/AuthLocalRepository.dart';
import 'abs/AuthService.dart';

class AuthSv implements AuthService {
  final AuthRepository _authRepository;

  AuthSv([AuthRepository? authRepository])
      : _authRepository = authRepository ?? AuthLocalRepository();


  @override
  Future<bool> register(IUser user) async{
    try {
      return await _authRepository.register(user);
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
    }

  @override
  Future<bool> signIn(String email, String password) async{
    try {
      return await _authRepository.signIn(email, password);
    } catch (e) {
      throw Exception('Failed to sign In: $e');
    }
  }

  @override
  Future<bool> signOut() async{
    try {
      return await _authRepository.signOut();
    } catch (e) {
      throw Exception('Failed to Sign Out: $e');
    }
  }

  @override
  Future<bool> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
