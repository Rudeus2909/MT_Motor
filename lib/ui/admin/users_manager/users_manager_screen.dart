import 'package:flutter/material.dart';
import 'package:motor_app/auth/login_screen.dart';
import 'package:motor_app/manager/user_manager.dart';
import 'package:motor_app/models/user_model.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/admin/users_manager/edit_users.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:provider/provider.dart';

class UserManagerScreen extends StatefulWidget {
  const UserManagerScreen({Key? key}) : super(key: key);

  @override
  State<UserManagerScreen> createState() => _UserManagerScreenState();
}

class _UserManagerScreenState extends State<UserManagerScreen> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final fetchedUsers = await context.read<UserManager>().fetchUser();
    setState(() {
      users = fetchedUsers;
    });
  }

  void navigateToEditUsersScreen(int idUser) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUsersScreen(idUser: idUser),
      ),
    );
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
                      overflow: TextOverflow.visible,
                    ),
                    actions: [
                      Tooltip(
                        message: "Đăng xuất",
                        child: IconButton(
                          onPressed: () {showDialog(
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
                            );},
                          icon: const Icon(Icons.logout),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context)
                    .size
                    .width, // Sử dụng chiều rộng của màn hình
              ),
              child: PaginatedDataTable(
                header: Center(
                  child: Text(
                    'Danh sách tài khoản trên ứng dụng',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                horizontalMargin: 2,
                columnSpacing: 5,
                rowsPerPage: 7,
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('E-mail')),
                  DataColumn(label: Text('Vai trò')),
                  DataColumn(label: Text('Hiệu chỉnh'))
                ],
                // Sử dụng UserDataSource để cung cấp dữ liệu
                source: UserDataSource(users, (int idUser) {
                  navigateToEditUsersScreen(idUser);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DataTableSource cho dữ liệu người dùng
class UserDataSource extends DataTableSource {
  final List<UserModel> users;
  final void Function(int idUser)? onEdit;

  UserDataSource(this.users, this.onEdit);

  @override
  DataRow? getRow(int index) {
    if (index >= users.length) return null;
    final user = users[index];
    return DataRow(
      cells: [
        DataCell(Text(user.idUser.toString())),
        DataCell(Text(user.email)),
        DataCell(Text(user.role == "admin" ? "Quản trị viên" : "Khách hàng")),
        DataCell(
          Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                onEdit?.call(user.idUser);
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
