import 'package:flutter/material.dart';
import 'package:motor_app/models/user_model.dart';
import 'package:motor_app/services/user_service.dart';

class UserManager with ChangeNotifier {
  List<UserModel> userList = [];


  Future<List<UserModel>> fetchUser() async {
    var _userService = UserService();

    try {
      userList = await _userService.fetchUser();
    } catch (error) {
      print(error);
    }
    return userList;
  } 

  int get count {
    return userList.length;
  }
} 