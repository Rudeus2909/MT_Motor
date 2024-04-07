import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/cart/cart_screen.dart';
import 'package:motor_app/ui/screen.dart';
import 'package:motor_app/ui/widgets/social_login.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:motor_app/utils/global_colors.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Đăng nhập',
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
                  height: 25,
                ),

                //Button
                InkWell(
                  onTap: () async {
                    bool loginState = await context
                        .read<LoginService>()
                        .login(emailController.text, passwordController.text);
                    String userRole = context.read<LoginService>().role;
                    if (loginState == true) {
                      if (userRole == "admin") {
                        Fluttertoast.showToast(
                          msg: "Đăng nhập thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Đăng nhập thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageScreen(),
                          ),
                        );
                      }
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Thông báo"),
                            content:
                                Text("Thông tin đăng nhập không chính xác"),
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
                      'Đăng nhập',
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
            const Text('Chưa có tài khoản? '),
            InkWell(
              child: Text(
                'Đăng ký ngay',
                style: TextStyle(
                  color: GlobalColors.linkColor,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(RegisterScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
