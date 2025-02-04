import 'package:bloc_starter_pro/data/providers/api_service.dart';

class AuthRepository {

  // used dummy api
  final _loginUrl = "https://reqres.in/api/login";

  Future<String> loginUser(String email, String password) async {
    final params = {"email": email, "password": password};
    final response = await ApiService.post(_loginUrl, params);
    return response["token"];
  }
}
