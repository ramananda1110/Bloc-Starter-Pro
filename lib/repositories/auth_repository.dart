import 'package:bloc_starter_pro/utils/local_storage.dart';

class AuthRepository {
  Future<bool> isLoggedIn() async {
    return await LocalStorage.getToken() != null;
  }

  Future<void> login(String token) async {
    await LocalStorage.saveToken(token);
  }

  Future<void> logout() async {
    await LocalStorage.clearToken();
  }
}
