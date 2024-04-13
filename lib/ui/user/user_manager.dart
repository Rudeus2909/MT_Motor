import 'package:flutter/material.dart';
import 'package:motor_app/models/user_model.dart';
import 'package:motor_app/services/user_service.dart';

class UserManager with ChangeNotifier {
  List<UserModel> userList = [];
  final _userService = UserService();

  Future<List<UserModel>> fetchUser() async {
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

  //Hiển thị người dùng theo id
  late List<UserModel> user = [];
  Future<void> fetchUserById(int idUser) async {
    try {
      user = await _userService.fetchUserById(idUser);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  //Cập nhật thông tin người dùng
  Future updateUserInfo(
    int idUser,
    String name,
    String address,
    String email,
    String phone,
  ) async {
    await _userService.updateUserInfo(idUser, name, address, email, phone);
    notifyListeners();
  }

  //Cập nhật mật khẩu người dùng
  Future updateUserPassword(int idUser, String password) async {
    await _userService.updateUserPassword(idUser, password);
    notifyListeners();
  }

  //Cập nhật hình ảnh đại diện của người dùng
  Future updateUserAvatar(int idUser, String imageUrl) async {
    await _userService.updateUserAvatar(idUser, imageUrl);
    notifyListeners();
  }
}
