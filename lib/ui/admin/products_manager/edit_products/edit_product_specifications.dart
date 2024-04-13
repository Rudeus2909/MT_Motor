import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/models/product_model.dart';
import 'package:motor_app/ui/admin/admin_home_page.dart';
import 'package:motor_app/ui/products/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class EditProductSpecificationScreen extends StatefulWidget {
  const EditProductSpecificationScreen({super.key, required this.idProduct});

  final int idProduct;

  @override
  State<EditProductSpecificationScreen> createState() =>
      _EditProductSpecificationScreenState();
}

class _EditProductSpecificationScreenState
    extends State<EditProductSpecificationScreen> {
  late final ProductModel _productModel;
  final TextEditingController productName = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController width = TextEditingController();
  final TextEditingController length = TextEditingController();
  final TextEditingController petroTank = TextEditingController();
  final TextEditingController engine = TextEditingController();
  final TextEditingController cylinder = TextEditingController();
  final TextEditingController maximumCapacity = TextEditingController();
  final TextEditingController oilCacacity = TextEditingController();
  final TextEditingController fuelConsumption = TextEditingController();
  final TextEditingController gear = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProductManager>().fetchProductDetail(widget.idProduct);
    _productModel = context.read<ProductManager>().findById(widget.idProduct)!;
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
                      'Chỉnh sửa thông số',
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.visible,
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
                if (productManager.productDetail.isNotEmpty) {
                  return SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Text(
                            'Tên xe',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Container(
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
                              controller: productName,
                              text: _productModel.productName,
                              textInputType: TextInputType.text,
                              obscure: false,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            EditTextForm(
                              title: 'Trọng lượng',
                              specifications: weight,
                              hintText:
                                  productManager.productDetail[0].weight ??
                                      "Chưa có thông tin này",
                              width: 100,
                            ),
                            EditTextForm(
                              specifications: height,
                              hintText:
                                  productManager.productDetail[0].height ??
                                      "Chưa có thông tin này",
                              title: 'Chiều cao',
                              width: 100,
                            ),
                            EditTextForm(
                              title: 'Chiều rộng',
                              specifications: width,
                              hintText: productManager.productDetail[0].width ??
                                  "Chưa có thông tin này",
                              width: 100,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 70,
                            ),
                            EditTextForm(
                              specifications: length,
                              hintText:
                                  productManager.productDetail[0].length ??
                                      "Chưa có thông tin này",
                              title: 'Chiều dài',
                              width: 100,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            EditTextForm(
                              specifications: petroTank,
                              hintText: productManager
                                      .productDetail[0].petroTankCapacity ??
                                  "Chưa có thông tin này",
                              title: 'Dung tích bình xăng',
                              width: 85,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            EditTextForm(
                              specifications: oilCacacity,
                              hintText:
                                  productManager.productDetail[0].oilCapacity ??
                                      "Chưa có thông tin này",
                              title: 'Dung tích nhớt',
                              width: 80,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            EditTextForm(
                              specifications: length,
                              hintText: productManager.productDetail[0].gear ??
                                  "Chưa có thông tin này",
                              title: 'Hộp số',
                              width: 120,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            EditTextForm(
                              specifications: cylinder,
                              hintText: productManager
                                      .productDetail[0].cylinderCapacity ??
                                  "Chưa có thông tin này",
                              title: 'Dung tích xy-lanh',
                              width: 110,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            EditTextForm(
                              specifications: fuelConsumption,
                              hintText: productManager
                                      .productDetail[0].fuelConsumption ??
                                  "Chưa có thông tin này",
                              title: 'Tiêu hao nhiên liệu',
                              width: 130,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            EditTextForm(
                              specifications: engine,
                              hintText:
                                  productManager.productDetail[0].engineType ??
                                      "Chưa có thông tin này",
                              title: 'Loại động cơ',
                              width: 410,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            EditTextForm(
                              specifications: maximumCapacity,
                              hintText: productManager
                                      .productDetail[0].maximumCapacity ??
                                  "Chưa có thông tin này",
                              title: 'Công suất tối đa',
                              width: 410,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
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
    required this.specifications,
    required this.hintText,
    required this.title,
    this.width,
  });

  final TextEditingController specifications;
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
            controller: specifications,
            text: hintText,
            textInputType: TextInputType.text,
            obscure: false,
          ),
        ),
      ],
    );
  }
}
