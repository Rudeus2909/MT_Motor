import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/ui/admin/admin_home_page.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class EditProductColorDetailScreen extends StatefulWidget {
  const EditProductColorDetailScreen(
      {super.key, required this.idProduct, required this.idColor});

  final int idProduct;
  final int idColor;

  @override
  State<EditProductColorDetailScreen> createState() =>
      _EditProductColorDetailScreenState();
}

class _EditProductColorDetailScreenState
    extends State<EditProductColorDetailScreen> {
  Color _selectedColor = Colors.white;
  final TextEditingController price = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController imageUrl = TextEditingController();

  String colorName = "";
  String getColorNameFromHex(Color color) {
    final colorName = ColorNames.guess(color);
    return colorName;
  }

  @override
  void initState() {
    super.initState();
    context
        .read<ProductManager>()
        .fetchProductColorInfo(widget.idProduct, widget.idColor);
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
                    showBackArrow: true,
                    title: Text(
                      'Chỉnh sửa thông tin xe',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Consumer<ProductManager>(
              builder: (context, productManager, child) {
                if (productManager.productColorInfo.isNotEmpty) {
                  return SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Text(
                            'Chọn màu xe',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Chọn màu'),
                                    content: SingleChildScrollView(
                                      child: SizedBox(
                                        height: 500,
                                        width: 400,
                                        child: ColorPicker(
                                          initialPicker: Picker.paletteHue,
                                          color: _selectedColor,
                                          onChanged: (Color color) {
                                            setState(() {
                                              _selectedColor = color;
                                              colorName = getColorNameFromHex(
                                                  _selectedColor);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Xong',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selectedColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: const SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            EditTextForm(
                              detail: price,
                              hintText: productManager.productColorInfo[0].price
                                  .toString(),
                              title: 'Giá',
                              width: 130,
                            ),
                            EditTextForm(
                              detail: amount,
                              hintText: productManager
                                  .productColorInfo[0].amount
                                  .toString(),
                              title: 'Số lượng',
                              width: 130,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: EditTextForm(
                            detail: imageUrl,
                            hintText: 'Nhập đường dẫn hình ảnh',
                            title: 'Hình ảnh',
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
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            context.read<ProductManager>().updateProductColor(
                  widget.idProduct,
                  widget.idColor,
                  colorName,
                  price.text,
                  amount.text,
                  imageUrl.text,
                );
            Fluttertoast.showToast(
              msg: "Cập nhật thành công",
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
                builder: (context) => const AdminHomePage(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Cập nhật'),
          ),
        ),
      ),
    );
  }
}

class EditTextForm extends StatelessWidget {
  const EditTextForm({
    super.key,
    required this.detail,
    this.hintText,
    required this.title,
    this.width,
  });

  final TextEditingController detail;
  final String? hintText;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: TextForm(
            controller: detail,
            text: hintText!,
            textInputType: TextInputType.text,
            obscure: false,
          ),
        ),
      ],
    );
  }
}
