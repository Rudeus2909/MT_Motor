import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/manager/user_manager.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/user/change_password_screen.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

final _formkey = GlobalKey<FormState>();

class EditUsersScreen extends StatefulWidget {
  const EditUsersScreen({super.key, required this.idUser});

  final int idUser;

  @override
  State<EditUsersScreen> createState() => _EditUsersScreenState();
}

class _EditUsersScreenState extends State<EditUsersScreen> {
  String currentOption = '';
  late int idUser;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserManager>().fetchUserById(widget.idUser);
    idUser = context.read<LoginService>().idUser;
    currentOption = context.read<LoginService>().role;
  }

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
                    title: Text(
                      'Quản lý tài khoản',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    showBackArrow: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            widget.idUser == idUser
                ? Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Consumer<UserManager>(
                      builder: (context, userManager, child) {
                        if (userManager.user.isNotEmpty) {
                          return Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Tên người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].name ??
                                        "Người dùng chưa có thông tin này",
                                    prefixIcon: const Icon(
                                        Icons.verified_user_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (name) => name!.length < 5
                                      ? 'Tên phải có ít nhất 5 kí tự'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'E-mail người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].email,
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'E-mail không hợp lệ!';
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Địa chỉ người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].address ??
                                        "Người dùng chưa có thông tin này",
                                    prefixIcon: const Icon(Icons.home_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (address) => address!.length < 10
                                      ? 'Địa chỉ phải có ít nhât 10 kí tự'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Số điện thoại người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].phone ??
                                        "Người dùng chưa có thông tin này",
                                    prefixIcon:
                                        const Icon(Icons.phone_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (phone) => phone!.length < 10
                                      ? 'Số điện thoại phải có 10 số'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Vai trò người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 'admin',
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },
                                    ),
                                    const Text('Quản trị viên'),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Radio(
                                      value: 'user',
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },
                                    ),
                                    const Text('Khách hàng'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangePasswordScreen(
                                                      idUser: widget.idUser),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(150, 50),
                                          padding: const EdgeInsets.all(10),
                                          backgroundColor: Colors.lightBlue,
                                          side: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Đổi mật khẩu'),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            context
                                                .read<UserManager>()
                                                .updateUserInfo(
                                                  widget.idUser,
                                                  nameController.text,
                                                  addressController.text,
                                                  emailController.text,
                                                  phoneController.text,
                                                );
                                            context
                                                .read<UserManager>()
                                                .editUserRole(
                                                  widget.idUser,
                                                  currentOption,
                                                );
                                            Fluttertoast.showToast(
                                              msg: "Cập nhật thành công",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 19, 15, 15),
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(150, 50),
                                          padding: const EdgeInsets.all(10),
                                          backgroundColor: Colors.red,
                                          side: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Xác nhận'),
                                        ),
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
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Consumer<UserManager>(
                      builder: (context, userManager, child) {
                        if (userManager.user.isNotEmpty) {
                          return Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Tên người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].name ??
                                        "Người dùng chưa có thông tin này",
                                    prefixIcon: const Icon(
                                        Icons.verified_user_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'E-mail người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].email,
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Địa chỉ người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].address ??
                                        "Người dùng chưa có thông tin này",
                                    prefixIcon: const Icon(Icons.home_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Số điện thoại người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: userManager.user[0].phone ??
                                        "Người dùng chưa có thông tin này",
                                    prefixIcon:
                                        const Icon(Icons.phone_outlined),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Vai trò người dùng',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 'admin',
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },
                                    ),
                                    const Text('Quản trị viên'),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Radio(
                                      value: 'user',
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },
                                    ),
                                    const Text('Khách hàng'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        context
                                            .read<UserManager>()
                                            .editUserRole(
                                                widget.idUser, currentOption);
                                        Fluttertoast.showToast(
                                          msg:
                                              "Chỉnh sửa vai trò người dùng thành công",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: const Color.fromARGB(
                                              255, 19, 15, 15),
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(150, 50),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.red,
                                      side:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Xác nhận'),
                                    ),
                                  ),
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
                  ),
          ],
        ),
      ),
    );
  }
}
