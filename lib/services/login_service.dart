import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:8080/php_api/login.php'),
        body: {
          'email': email,
          'password': password,
        },
      );
      var data = jsonDecode(response.body);
      if (data == "Success") {
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
