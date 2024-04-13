import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/ui/widgets/custom_list_tile.dart';
import 'package:motor_app/ui/user/change_password_screen.dart';
import 'package:motor_app/ui/user/user_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key, required this.idUser});

  final int idUser;

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserManager>().fetchUserById(widget.idUser);
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  bool _showImagePathForm = false;

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
                      'Sửa đổi thông tin tài khoản',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Consumer<UserManager>(
              builder: (context, userManager, child) {
                if (userManager.user.isNotEmpty) {
                  return SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(userManager.user[0].userAvatar),
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showImagePathForm = !_showImagePathForm;
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Sửa ảnh đại diện'),
              ),
            ),
            if (_showImagePathForm)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextForm(
                      controller: imageController,
                      text: 'Nhập đường dẫn hình ảnh',
                      textInputType: TextInputType.url,
                      obscure: false,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserManager>().updateUserAvatar(
                            widget.idUser,
                            imageController.text,
                          );
                      Fluttertoast.showToast(
                        msg: "Cập nhật hình ảnh thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cập nhật'),
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 25,
            ),
            Consumer<UserManager>(
              builder: (context, userManager, child) {
                if (userManager.user.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Họ và tên',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextForm(
                          controller: usernameController,
                          text: userManager.user[0].name ??
                              "Bạn chưa có thông tin này",
                          textInputType: TextInputType.text,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty){
                              return "Vui lòng nhập thông tin này";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Địa chỉ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextForm(
                          controller: addressController,
                          text: userManager.user[0].address ??
                              "Bạn chưa có thông tin này",
                          textInputType: TextInputType.text,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty){
                              return "Vui lòng nhập thông tin này";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'E-mail',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextForm(
                          controller: emailController,
                          text: userManager.user[0].email,
                          textInputType: TextInputType.emailAddress,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty){
                              return "Vui lòng nhập thông tin này";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Số điện thoại',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextForm(
                          controller: phoneController,
                          text: userManager.user[0].phone ??
                              "Bạn chưa có thông tin này",
                          textInputType: TextInputType.phone,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty){
                              return "Vui lòng nhập thông tin này";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Cập nhật thông tin'),
                                    content: const Text(
                                        'Bạn có muốn cập nhật thông tin này không?'),
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
                                              .updateUserInfo(
                                                widget.idUser,
                                                usernameController.text,
                                                addressController.text,
                                                emailController.text,
                                                phoneController.text,
                                              );
                                          Fluttertoast.showToast(
                                            msg:
                                                "Thay đổi thông tin thành công",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          Navigator.pop(context, 'Có');
                                          setState(() {});
                                        },
                                        child: const Text('Có'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 40),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Cập nhật'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              icon: Icons.password,
              title: 'Đổi mật khẩu',
              subtitle: 'Đổi mật khẩu cho tài khoản của bạn',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChangePasswordScreen(idUser: widget.idUser),
                  ),
                );
              },
              trailing: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
