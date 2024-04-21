
import '../../model/User.dart';

abstract class AuthService {
  Future<bool> register(IUser iUser);
  Future<bool> signIn(String email, String password);
  Future<bool> signOut();
  Future<bool> forgotPassword(String email);
}