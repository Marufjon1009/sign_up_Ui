import 'package:flutter_lesson_3/utils/prefs/prefs.dart';
import 'package:uuid/uuid.dart';

abstract class LoginReposiyory {
  Future<String?> signIn({required String? login, required String? password});
  Future<String?> signUp(
      {required String? login,
      required String? password,
      required String? confirmPassword});
  Future<bool?> logout();
}

class LoginRepo extends LoginReposiyory {
  LoginRepo.instance();
  static final _instance = LoginRepo.instance();
  factory LoginRepo() {
    return _instance;
  }

  ///logout
  @override
  Future<bool?> logout() {
    return Prefs.deleteData(key: 'token');
  }

  ///logIn
  @override
  Future<String?> signIn(
      {required String? login, required String? password}) async {
    if (login!.isEmpty) return null;
    if (password!.isEmpty) return null;

    bool? chackPassword =
        password == await Prefs.loadData<String>(key: 'password');
    bool? chackLogin = login == await Prefs.loadData<String>(key: 'login');

    if (chackLogin && chackPassword) {
      final token = const Uuid().v1();
      final succes = await Prefs.savedData(key: 'token', data: token);
      if (succes!) return token;
    }
    return null;
  }

  ///Sing Up
  @override
  Future<String?> signUp(
      {required String? login,
      required String? password,
      required String? confirmPassword}) async {
    if (login!.isEmpty) {
      return null;
    }

    if (confirmPassword!.isEmpty) {
      return null;
    }
    if (password != confirmPassword) {
      return null;
    }

    final token = const Uuid().v1();
    await Prefs.updateData<String>(key: 'login', data: login);
    await Prefs.updateData<String>(key: 'password', data: password);
    final isSaved = await Prefs.updateData<String>(key: 'token', data: token);
    if (isSaved!) {
      return token;
    }
    return null;
  }
}
