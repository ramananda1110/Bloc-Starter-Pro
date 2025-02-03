import 'package:bloc_starter_pro/model/user_model.dart';
import 'package:bloc_starter_pro/services/api_service.dart';

class UserRepository {
  Future<List<UserModel>> fetchUsers() async {
    final response =
        await ApiService.get('https://jsonplaceholder.typicode.com/users');
    return response.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
}
