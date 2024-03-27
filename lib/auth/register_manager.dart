
import 'package:flutter/material.dart';
import 'package:motor_app/services/register_service.dart';

class RegisterManager with ChangeNotifier {
  final _registerService = RegisterService();

  Future<bool> register(String email, String password) async {
    var registerState = await _registerService.register(email, password);
    return registerState;
  }
}