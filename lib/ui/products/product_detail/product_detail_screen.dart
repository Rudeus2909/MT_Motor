import 'package:flutter/material.dart';
import 'package:motor_app/services/product_service.dart';
import 'package:motor_app/ui/products/product_detail/curved_edges_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late List<dynamic> productDetail = [];

  @override
  void initState() {
    super.initState();
    fetchProductDetail(widget.productId);
  }

  Future<void> fetchProductDetail(int productId) async {
    try {
      productDetail = await ProductService().fetchProductDetail(productId);
      setState(() {}); // Cập nhật lại UI sau khi nhận được dữ liệu
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chi tiết'),
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
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Product Image Slider
                  CurvedEdgesWidget(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Center(
                              child: Image.asset('assets/black_logo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Product Detail
                  const Padding(
                    padding:
                        EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
                    child: Column(
                      children: <Widget>[
                        //Rating & Share Button
                        RatingAndShare(),
                        //Price
                        Text(
                          '2000\$',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Title
                        Text(
                          'HAHA',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        //Status
                        Text(
                          'Còn 9 sản phẩm',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
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
                  buildDetailRow(
                    title: 'Trọng lượng bản thân',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['weight']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Chiều dài',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['_length']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Chiều rộng',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['width']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Chiều cao',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['height']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Dung tích bình xăng',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['petro_tank_capacity']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Dung tích xy-lanh',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['cylinder_capacity']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Loại động cơ',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['engine_type']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Công suất tối đa',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['maximum_capacity']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Mức tiêu thụ nhiên liệu',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['fuel_consumption']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  buildDetailRow(
                    title: 'Hộp số',
                    value: productDetail.isNotEmpty
                        ? productDetail[0]['gear']
                        : 'Loading...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
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
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            SizedBox(
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
          style: const TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.right,
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}
