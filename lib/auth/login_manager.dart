import 'package:flutter/material.dart';
import 'package:motor_app/services/login_service.dart';

class LoginManager with ChangeNotifier {
  final _loginService = LoginService();

  Future<bool> login(String email, String password) async {
    var loginState = await _loginService.login(email, password);
    return loginState;
  }
}
