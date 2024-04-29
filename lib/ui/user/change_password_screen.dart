import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/manager/user_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, required this.idUser});

  final int idUser;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    showBackArrow: true,
                    title: Text(
                      'Đổi mật khẩu',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextForm(
                    controller: oldPasswordController,
                    text: 'Nhập mật khẩu hiện tại',
                    textInputType: TextInputType.text,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextForm(
                    controller: newPasswordController,
                    text: 'Nhập mật khẩu mới',
                    textInputType: TextInputType.text,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextForm(
                    controller: confirmPasswordController,
                    text: 'Xác nhận mật khẩu mới',
                    textInputType: TextInputType.text,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          var password =
                              context.read<UserManager>().user[0].password;
                          if (oldPasswordController.text != password) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    height: 85,
                                    child: Column(
                                      children: [
                                        const Text(
                                            'Mật khẩu hiện tại không chính xác'),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Đóng'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (newPasswordController.text !=
                              confirmPasswordController.text) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    height: 85,
                                    child: Column(
                                      children: [
                                        const Text(
                                            'Xác nhận mật khẩu không chính xác'),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Đóng'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Đổi mật khẩu'),
                                content: const Text(
                                    'Bạn có muốn đổi mật khẩu không?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Không'),
                                    child: const Text('Không'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<UserManager>()
                                          .updateUserPassword(
                                            widget.idUser,
                                            newPasswordController.text,
                                          );
                                      Fluttertoast.showToast(
                                        msg: "Thay đổi mật khẩu thành công",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      Navigator.pop(context, 'Có');
                                    },
                                    child: const Text('Có'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Đổi mật khẩu'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
