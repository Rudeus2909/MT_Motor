import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motor_app/models/user_model.dart';

class LoginService  with ChangeNotifier{
  String role = "";
  int idUser = 0;
  List<UserModel> userList = [];
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/login.php'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        userList = List<UserModel>.from(
            jsonData.map((items) => UserModel.fromJson(items)));
        role = userList[0].role;
        idUser = userList[0].idUser;
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
  
  Future logout() async {
    try {
      role = "";
      idUser = 0;
      userList = [];
    } catch (error) {
      print(error);
    }
  }
}
