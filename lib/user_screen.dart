import 'package:flutter/material.dart';
import 'package:motor_app/models/user_model.dart';
import 'package:motor_app/user_manager.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserManager>().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Consumer<UserManager>(
        builder: (context, userManager, child) {
          if (userManager.userList.isNotEmpty) {
            // Kiểm tra xem danh sách có phần tử hay không
            // Truy cập phần tử trong danh sách
            UserModel user = userManager.userList.first;
            return Text(user.name);
          } else {
            return Text(
                'No users available'); // Xử lý trường hợp danh sách rỗng
          }
        },
      ),
    );
  }
}
