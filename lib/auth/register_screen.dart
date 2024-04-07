import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/services/register_service.dart';
import 'package:motor_app/ui/screen.dart';
import 'package:provider/provider.dart';
import '../utils/global_colors.dart';
import '../ui/widgets/text_form.dart';
import '../ui/widgets/social_register.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/black_logo.png',
                    height: 250,
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                //Email
                TextForm(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(
                  height: 6,
                ),

                //Password
                TextForm(
                  controller: passwordController,
                  text: 'Mật khẩu',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 6,
                ),

                //Re-Password
                // TextForm(
                //   controller: rePasswordController,
                //   text: 'Nhập lại mật khẩu',
                //   textInputType: TextInputType.text,
                //   obscure: true,
                // ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async {
                    bool loginState = await context
                        .read<RegisterService>()
                        .register(
                            emailController.text, passwordController.text);
                    if (loginState == true) {
                      Fluttertoast.showToast(
                        msg: "Đăng ký thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Thông báo"),
                            content:
                                Text("Tài khoản đã tồn tại"),
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                        color: GlobalColors.mainColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ]),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Đã có tài khoản? '),
            InkWell(
              child: Text(
                'Đăng nhập ngay',
                style: TextStyle(
                  color: GlobalColors.linkColor,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
