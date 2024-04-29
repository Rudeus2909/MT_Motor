import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/manager/order_manager.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class PayMentScreen extends StatefulWidget {
  const PayMentScreen(
      {super.key, required this.idColor, required this.idProduct});

  final int idColor;
  final int idProduct;

  @override
  State<PayMentScreen> createState() => _PayMentScreenState();
}

class _PayMentScreenState extends State<PayMentScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProductManager>()
        .fetchProductColorInfo(widget.idProduct, widget.idColor);
  }

  final TextEditingController ordererController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    title: Text(
                      'Đặt mua sản phẩm',
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
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 10),
              child: Text(
                'Thông tin đặt mua',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            OrderInfo(
              text: 'Họ và tên',
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextForm(
                  controller: ordererController,
                  text: 'Họ và tên',
                  textInputType: TextInputType.text,
                  obscure: false,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextForm(
                controller: emailController,
                text: 'Email',
                textInputType: TextInputType.emailAddress,
                obscure: false,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextForm(
                controller: addressController,
                text: 'Địa chỉ',
                textInputType: TextInputType.streetAddress,
                obscure: false,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextForm(
                controller: phoneController,
                text: 'Số điện thoại',
                textInputType: TextInputType.phone,
                obscure: false,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 10),
              child: Text(
                'Thông tin sản phẩm',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer2<ProductManager, ProductManager>(
              builder: (context, productManager, productColorInfo, child) {
                if (productManager.findById(widget.idProduct) != null &&
                    productColorInfo.productColorInfo.isNotEmpty) {
                  var productName =
                      productManager.findById(widget.idProduct)!.productName;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black38),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                productColorInfo.productColorInfo[0].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        Table(
                          children: [
                            TableRow(children: [
                              Text(
                                'Tên sản phẩm',
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                productName,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ]),
                            TableRow(children: [
                              Text(
                                'Giá',
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                productColorInfo.productColorInfo[0].price
                                    .toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              )
                            ]),
                            TableRow(children: [
                              Text(
                                'Màu sắc',
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                productColorInfo.productColorInfo[0].colorName,
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              )
                            ])
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
              height: 30,
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(130, 20),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.grey,
                  side: const BorderSide(color: Colors.black)),
              child: const Text(
                'Trở về',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            Consumer<ProductManager>(
              builder: (context, productColorInfo, child) {
                if (productColorInfo.productColorInfo.isNotEmpty) {
                  return ElevatedButton(
                    onPressed: () async {
                      int quantityAfterOrdering =
                          productColorInfo.productColorInfo[0].amount - 1;
                      var idUser = context.read<LoginService>().idUser;
                      var total = productColorInfo.productColorInfo[0].price;
                      var now = DateTime.now().toLocal();
                      var orderTime =
                          '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}';

                      var imageUrl =
                          productColorInfo.productColorInfo[0].imageUrl;
                      await context.read<OrderManager>().addOrder(
                            idUser,
                            orderTime,
                            widget.idProduct,
                            total,
                            ordererController.text,
                            addressController.text,
                            emailController.text,
                            phoneController.text,
                            widget.idColor,
                            quantityAfterOrdering,
                            imageUrl,
                          );
                      Fluttertoast.showToast(
                        msg: "Đặt mua thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 20),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.red,
                        side: const BorderSide(color: Colors.black)),
                    child: const Text('Đặt mua'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.text, required this.child});

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(text),
          ),
          child,
        ],
      ),
    );
  }
}
