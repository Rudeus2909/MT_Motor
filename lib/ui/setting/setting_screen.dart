import 'package:flutter/material.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/orders/orders_screen.dart';
import 'package:motor_app/ui/products/favorite_screen.dart';
import 'package:motor_app/ui/screen.dart';
import 'package:motor_app/ui/widgets/custom_list_tile.dart';
import 'package:motor_app/ui/user/user_setting_screen.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/user/user_manager.dart';
import 'package:provider/provider.dart';

import '../widgets/header_container.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    var idUser = context.read<LoginService>().idUser;
    context.read<UserManager>().fetchUserById(idUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Consumer<UserManager>(
        builder: (context, userManager, child) {
          if (userManager.user.isNotEmpty) {
            return Column(
              children: [
                HeaderContainer(
                  child: Column(
                    children: [
                      CustomAppbar(
                        title: Text(
                          'Cài đặt tài khoản và ứng dụng',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: Colors.black),
                        ),
                      ),
                      ListTile(
                        leading: SizedBox(
                          height: 55,
                          width: 55,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child:
                                Image.network(userManager.user[0].userAvatar),
                          ),
                        ),
                        title: Text(
                          userManager.user[0].name ?? "Người dùng",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: Colors.black),
                        ),
                        subtitle: Text(
                          userManager.user[0].email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      //Account Setting
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cài đặt tài khoản',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      CustomListTile(
                        icon: Icons.home,
                        title: 'Cập nhật thông tin tài khoản',
                        subtitle: 'Cập nhật các thông tin tài khoản của bạn',
                        onTap: () {
                          var idUser = userManager.user[0].idUser;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserSettingScreen(idUser: idUser),
                            ),
                          );
                        },
                      ),
                      CustomListTile(
                        icon: Icons.favorite,
                        title: 'Yêu thích',
                        subtitle: 'Trang các sản phẩm bạn đã thích',
                        onTap: () {
                          var idUser = context.read<LoginService>().idUser;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FavoriteScreen(idUser: idUser),
                              ));
                        },
                      ),
                      CustomListTile(
                        icon: Icons.add_business_rounded,
                        title: 'Đơn hàng của tôi',
                        subtitle: 'Các đơn đang chờ xử lý và đã hoàn thành',
                        onTap: () {
                          var idUser = context.read<LoginService>().idUser;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OrdersScreen(idUser: idUser),
                              ));
                        },
                      ),
                      CustomListTile(
                        icon: Icons.account_balance,
                        title: 'Tài khoản ngân hàng',
                        subtitle: 'Rút số dư về tài khoản ngân hàng đã đăng ký',
                        onTap: () {},
                      ),
                      CustomListTile(
                        icon: Icons.discount,
                        title: 'Mã giảm giá',
                        subtitle: 'Danh sách tất cả các mã giảm giá',
                        onTap: () {},
                      ),
                      CustomListTile(
                        icon: Icons.present_to_all,
                        title: 'Điều khoản sử dụng',
                        subtitle: 'Các điều khoản sử dụng của cửa hàng',
                        onTap: () {},
                      ),
                      CustomListTile(
                        icon: Icons.padding,
                        title: 'Hướng dẫn sử dụng',
                        subtitle: 'Hướng dẫn sử dụng ứng dụng',
                        onTap: () {},
                      ),
                      CustomListTile(
                        icon: Icons.logout,
                        title: 'Đăng xuất',
                        subtitle: 'Đăng xuất khỏi ứng dụng',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Đăng xuất'),
                              content: const Text(
                                  'Bạn có muốn đăng xuất khỏi ứng dụng'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Không'),
                                  child: const Text('Không'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<LoginService>().logout();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text('Có'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      //App setting
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cài đặt ứng dụng',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      CustomListTile(
                        icon: Icons.padding,
                        title: 'Tìm kiếm an toàn',
                        subtitle: 'Bật chế độ tìm kiếm an toàn',
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      CustomListTile(
                        icon: Icons.padding,
                        title: 'Đổi chế độ',
                        subtitle: 'Đổi chế độ sáng tối',
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
