import 'dart:convert';

import 'package:motor_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  //Lấy tất cả các người dùng
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
    return userList;
  }

  //Lấy thông tin người dùng theo id_user
  Future<List<UserModel>> fetchUserById(int idUser) async {
    List<UserModel> user = [];
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.56.1:8080/php_api/user.php?id_user=$idUser'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        user = List<UserModel>.from(
            jsonData.map((items) => UserModel.fromJson(items)));
      }
    } catch (error) {
      print(error);
    }
    return user;
  }

  //Cập nhật thông tin người dùng
  Future<bool> updateUserInfo(
    int idUser,
    String name,
    String address,
    String email,
    String phone,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/user.php?'),
        body: {
          'id_user': idUser.toString(),
          'user_name': name,
          'address': address,
          'email': email,
          'phone': phone,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  //Cập nhật mật khẩu người dùng
  Future<bool> updateUserPassword(int idUser, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/user.php?'),
        body: {
          'id_user': idUser.toString(),
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  //Cập nhật ảnh đại diện của người dùng
  Future<bool> updateUserAvatar(int idUser, String imageUrl) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/user.php?'),
        body: {
          'id_user': idUser.toString(),
          'user_avatar': imageUrl,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  //Cập nhật vai trò người dùng
  Future<bool> editUserRole(int idUser, String role) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/users/user_manager.php?'),
        body: {
          'id_user': idUser.toString(),
          'role': role,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
}
