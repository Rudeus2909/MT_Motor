import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/services/login_service.dart';
import 'package:motor_app/ui/payment/pay_ment_screen.dart';
import 'package:motor_app/manager/products_manager.dart';
import 'package:provider/provider.dart';
import '../../utils/get_product_color.dart';
import 'package:intl/intl.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    context.read<ProductManager>().fetchProductDetail(widget.productId);
    context.read<ProductManager>().fetchProductColors(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Consumer2<ProductManager, ProductManager>(
        builder: (context, productDetailManager, productColorManager, child) {
          if (productDetailManager.productDetail.isNotEmpty &&
              productColorManager.productColor.isNotEmpty) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Thông tin chi tiết',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text('Tổng quan'),
                    ),
                    Tab(
                      child: Text(
                        'Đặc điểm kỹ thuật',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  //Product Detail
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            //Main Image
                            SizedBox(
                              height: 400,
                              child: PageView.builder(
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    productColorManager.productColor.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Image.network(
                                      productColorManager
                                          .productColor[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Image Slider
                            Positioned(
                              right: 0,
                              bottom: 20,
                              left: 10,
                              child: SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount:
                                      productColorManager.productColor.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                              pageController.animateToPage(
                                                index,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: Curves.easeInOut,
                                              );
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: selectedIndex == index
                                                  ? Colors.blue.shade900
                                                  : Colors.transparent,
                                            ),
                                            child: Container(
                                              width: 80,
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                child: Image.network(
                                                  productColorManager
                                                      .productColor[index]
                                                      .imageUrl,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 24.0, left: 24.0, bottom: 24.0),
                          child: Column(
                            children: [
                              //Rating & Share Button
                              const RatingAndShare(),

                              //Product data
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Price
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'vi_VN',
                                      symbol: 'VNĐ',
                                      decimalDigits: 0,
                                    ).format(productColorManager
                                        .productColor[selectedIndex].price),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  //Title
                                  Consumer<ProductManager>(
                                    builder: (context, productManager, child) {
                                      if (productManager
                                              .findById(widget.productId) !=
                                          null) {
                                        var productName = productManager
                                            .findById(widget.productId)!
                                            .productName;
                                        return Text(
                                          productName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ),

                                  //Status
                                  Row(
                                    children: [
                                      const Text(
                                        'Số lượng sản phẩm trên cửa hàng: ',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        productColorManager
                                            .productColor[selectedIndex].amount
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //Color
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Màu sắc',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: productDetailManager
                                          .productDetail.length,
                                      itemBuilder: (context, index) {
                                        final item = productDetailManager
                                            .productDetail[index];
                                        final colorList = productColorManager
                                            .productColor
                                            .where((color) =>
                                                color.idProduct ==
                                                item.idProduct)
                                            .toList();
                                        return SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: colorList.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedIndex = index;
                                                          pageController
                                                              .animateToPage(
                                                            index,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            curve: Curves
                                                                .easeInOut,
                                                          );
                                                        });
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            selectedIndex ==
                                                                    index
                                                                ? Colors.blue
                                                                    .shade900
                                                                : Colors.white,
                                                        child: CircleAvatar(
                                                          radius: 23,
                                                          backgroundColor:
                                                              Colors.black,
                                                          child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundColor:
                                                                getColorFromString(
                                                                    colorList[
                                                                            index]
                                                                        .color),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Thông số kĩ thuật',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: <Widget>[
                            buildDetailRow(
                                title: 'Trọng lượng bản thân',
                                value: productDetailManager
                                        .productDetail[0].weight ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Chiều dài',
                                value: productDetailManager
                                        .productDetail[0].length ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Chiều rộng',
                                value: productDetailManager
                                        .productDetail[0].width ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Chiều cao',
                                value: productDetailManager
                                        .productDetail[0].height ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Dung tích bình xăng',
                                value: productDetailManager
                                        .productDetail[0].petroTankCapacity ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Dung tích xy-lanh',
                                value: productDetailManager
                                        .productDetail[0].cylinderCapacity ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Loại động cơ',
                                value: productDetailManager
                                        .productDetail[0].engineType ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Công suất tối đa',
                                value: productDetailManager
                                        .productDetail[0].maximumCapacity ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Mức tiêu thu nhiên liệu',
                                value: productDetailManager
                                        .productDetail[0].fuelConsumption ??
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Hộp số',
                                value: productDetailManager
                                        .productDetail[0].gear ??
                                    "Chưa có thông tin này"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
                        var favorite = true;
                        var idUser = context.read<LoginService>().idUser;
                        var idColor = productColorManager
                            .productColor[selectedIndex].idColor;
                        context.read<ProductManager>().favorite(
                            widget.productId, idUser, idColor!, favorite);
                        Fluttertoast.showToast(
                          msg: "Thêm vào yêu thích thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.red,
                          side: const BorderSide(color: Colors.black)),
                      child: const Text('Thêm vào yêu thích'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (productColorManager
                                .productColor[selectedIndex].amount ==
                            0) {
                          Fluttertoast.showToast(
                            msg:
                                "Số lượng sản phẩm trên cửa hàng không đủ để tiến hành đặt mua",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayMentScreen(
                                  idColor: productColorManager
                                      .productColor[selectedIndex].idColor!,
                                  idProduct: productColorManager
                                      .productColor[selectedIndex].idProduct),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.lightBlue,
                          side: const BorderSide(color: Colors.black)),
                      child: const Text('Đặt mua ngay'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Thông tin chi tiết',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text('Tổng quan'),
                    ),
                    Tab(
                      child: Text(
                        'Đặc điểm kỹ thuật',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  //Product Detail
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            //Main Image
                            SizedBox(
                              height: 400,
                              child: PageView.builder(
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    productColorManager.productColor.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Image.network(
                                      productColorManager
                                          .productColor[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Image Slider
                            Positioned(
                              right: 0,
                              bottom: 20,
                              left: 10,
                              child: SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount:
                                      productColorManager.productColor.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                              pageController.animateToPage(
                                                index,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: Curves.easeInOut,
                                              );
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: selectedIndex == index
                                                  ? Colors.blue.shade900
                                                  : Colors.transparent,
                                            ),
                                            child: Container(
                                              width: 80,
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                child: Image.network(
                                                  productColorManager
                                                      .productColor[index]
                                                      .imageUrl,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 24.0, left: 24.0, bottom: 24.0),
                          child: Column(
                            children: [
                              //Rating & Share Button
                              const RatingAndShare(),

                              //Product data
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Price
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'vi_VN',
                                      symbol: 'VNĐ',
                                      decimalDigits: 0,
                                    ).format(productColorManager
                                        .productColor[selectedIndex].price),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  //Title
                                  Consumer<ProductManager>(
                                    builder: (context, productManager, child) {
                                      if (productManager
                                              .findById(widget.productId) !=
                                          null) {
                                        var productName = productManager
                                            .findById(widget.productId)!
                                            .productName;
                                        return Text(
                                          productName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ),

                                  //Status
                                  Row(
                                    children: [
                                      const Text(
                                        'Số lượng sản phẩm trên cửa hàng: ',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        productColorManager
                                            .productColor[selectedIndex].amount
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //Color
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Màu sắc',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: productDetailManager
                                          .productDetail.length,
                                      itemBuilder: (context, index) {
                                        final item = productDetailManager
                                            .productDetail[index];
                                        final colorList = productColorManager
                                            .productColor
                                            .where((color) =>
                                                color.idProduct ==
                                                item.idProduct)
                                            .toList();
                                        return SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: colorList.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedIndex = index;
                                                          pageController
                                                              .animateToPage(
                                                            index,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            curve: Curves
                                                                .easeInOut,
                                                          );
                                                        });
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            selectedIndex ==
                                                                    index
                                                                ? Colors.blue
                                                                    .shade900
                                                                : Colors.white,
                                                        child: CircleAvatar(
                                                          radius: 23,
                                                          backgroundColor:
                                                              Colors.black,
                                                          child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundColor:
                                                                getColorFromString(
                                                                    colorList[
                                                                            index]
                                                                        .color),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Thông số kĩ thuật',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: <Widget>[
                            buildDetailRow(
                                title: 'Trọng lượng bản thân',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Chiều dài',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Chiều rộng',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Chiều cao',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Dung tích bình xăng',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Dung tích xy-lanh',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Loại động cơ',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Công suất tối đa',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Mức tiêu thu nhiên liệu',
                                value: 
                                    "Chưa có thông tin này"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            buildDetailRow(
                                title: 'Hộp số',
                                value: 
                                    "Chưa có thông tin này"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
                        var favorite = true;
                        var idUser = context.read<LoginService>().idUser;
                        var idColor = productColorManager
                            .productColor[selectedIndex].idColor;
                        context.read<ProductManager>().favorite(
                            widget.productId, idUser, idColor!, favorite);
                        Fluttertoast.showToast(
                          msg: "Thêm vào yêu thích thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.red,
                          side: const BorderSide(color: Colors.black)),
                      child: const Text('Thêm vào yêu thích'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (productColorManager
                                .productColor[selectedIndex].amount ==
                            0) {
                          Fluttertoast.showToast(
                            msg:
                                "Số lượng sản phẩm trên cửa hàng không đủ để tiến hành đặt mua",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayMentScreen(
                                  idColor: productColorManager
                                      .productColor[selectedIndex].idColor!,
                                  idProduct: productColorManager
                                      .productColor[selectedIndex].idProduct),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.lightBlue,
                          side: const BorderSide(color: Colors.black)),
                      child: const Text('Đặt mua ngay'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            //Rating
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '5.0',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),
        //Share Button
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: 24,
          ),
        ),
      ],
    );
  }
}

Widget buildDetailRow({required String title, required String value}) {
  return Row(
    children: <Widget>[
      const SizedBox(width: 35),
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      const SizedBox(width: 40),
      Expanded(
        child: Text(
          value,
          textAlign: TextAlign.right,
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}
