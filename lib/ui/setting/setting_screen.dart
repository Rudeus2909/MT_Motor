import 'package:flutter/material.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/payment/orders_screen.dart';
import 'package:motor_app/ui/products/favorite_screen.dart';
import 'package:motor_app/ui/setting/setting_menu_tile.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/user_manager.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                  Consumer<UserManager>(
                    builder: (context, userManager, child) {
                      if (userManager.user.isNotEmpty) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/black_logo.png'),
                            radius: 25,
                          ),
                          title: Text(
                            userManager.user[0].name,
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
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
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
                  SettingMenuTile(
                    icon: Icons.home,
                    title: 'Địa chỉ của tôi',
                    subtitle: 'Đặt địa chỉ giao hàng',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Icons.shopping_cart,
                    title: 'Yêu thích',
                    subtitle: 'Thêm, xóa sản phẩm và đến trang thanh toán',
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
                  SettingMenuTile(
                    icon: Icons.add_business_rounded,
                    title: 'Đơn hàng của tôi',
                    subtitle: 'Các đơn đang chờ xử lý và đã hoàn thành',
                    onTap: () {
                      var idUser = context.read<LoginService>().idUser;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrdersScreen(idUser: idUser),
                          ));
                    },
                  ),
                  SettingMenuTile(
                    icon: Icons.account_balance,
                    title: 'Tài khoản ngân hàng',
                    subtitle: 'Rút số dư về tài khoản ngân hàng đã đăng ký',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Icons.discount,
                    title: 'Mã giảm giá',
                    subtitle: 'Danh sách tất cả các mã giảm giá',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Icons.present_to_all,
                    title: 'Điều khoản sử dụng',
                    subtitle: 'Các điều khoản sử dụng của cửa hàng',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Icons.padding,
                    title: 'Hướng dẫn sử dụng',
                    subtitle: 'Hướng dẫn sử dụng ứng dụng',
                    onTap: () {},
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
                  SettingMenuTile(
                    icon: Icons.padding,
                    title: 'Tìm kiếm an toàn',
                    subtitle: 'Bật chế độ tìm kiếm an toàn',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingMenuTile(
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
        ),
      ),
    );
  }
}
