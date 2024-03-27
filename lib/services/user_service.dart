import 'dart:convert';

import 'package:motor_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> fetchUser() async {
    List<UserModel> userList = [];
    try {
      final response = await http
          .get(Uri.parse('http://192.168.56.1:8080/php_api/user.php?'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        userList = List<UserModel>.from(
            jsonData.map((items) => UserModel.fromJson(items)));
      }
    } catch (error) {
      print(error);
    }
    for (UserModel user in userList) {
      print(user.name);
    }
    return userList;
  }
}
