import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/admin/products_manager/show_products/products_manager_screen.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class AddProductColorScreen extends StatefulWidget {
  const AddProductColorScreen({super.key, required this.idProduct, required this.idCategory});

  final int idProduct;
  final int idCategory;

  @override
  State<AddProductColorScreen> createState() => _AddProductColorScreenState();
}

class _AddProductColorScreenState extends State<AddProductColorScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderContainer(
            child: Column(
              children: [
                CustomAppbar(
                  showBackArrow: true,
                  title: Text(
                    'Thêm màu cho sản phẩm',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
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
                                colorName = getColorNameFromHex(_selectedColor);
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
                            style: Theme.of(context).textTheme.titleLarge,
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
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
              AddTextForm(
                detail: price,
                hintText: 'Nhập giá tiền',
                title: 'Giá',
                width: 130,
              ),
              AddTextForm(
                detail: amount,
                hintText: 'Nhập số lượng',
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
            child: AddTextForm(
              detail: imageUrl,
              hintText: 'Nhập đường dẫn hình ảnh',
              title: 'Hình ảnh',
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            context.read<ProductManager>().addProductColor(
                  widget.idProduct,
                  colorName,
                  price.text,
                  amount.text,
                  imageUrl.text,
                );
            Fluttertoast.showToast(
              msg: "Thêm màu cho sản phẩm thành công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: const Color.fromARGB(255, 19, 15, 15),
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsManagerScreen(idCategory: widget.idCategory,),
              ),
            );
            context.read<ProductManager>().fetchProductsByCategory(widget.idCategory);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Thêm màu cho sản phẩm'),
          ),
        ),
      ),
    );
  }
}

class AddTextForm extends StatelessWidget {
  const AddTextForm({
    super.key,
    required this.detail,
    required this.hintText,
    required this.title,
    this.width,
  });

  final TextEditingController detail;
  final String hintText;
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
            text: hintText,
            textInputType: TextInputType.text,
            obscure: false,
          ),
        ),
      ],
    );
  }
}
