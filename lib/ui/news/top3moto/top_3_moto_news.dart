import 'package:flutter/material.dart';

class Top3Moto extends StatelessWidget {
  const Top3Moto(
      {super.key,
      required this.imageUrl1,
      required this.imageUrl2,
      required this.imageUrl3});

  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: 25.0, left: 25.0, bottom: 30.0, top: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              '3 Mẫu xe Moto dưới 100 triệu đáng sở hữu nhất hiện nay',
              style: Theme.of(context).textTheme.headlineSmall
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '26/01/2024 - 9:30',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Nếu là các "tín đồ" đam mê tốc độ thì chắc chắn các bạn không nên bỏ lỡ những dòng xe moto chất lượng từ thương hiệu Yamaha bên dưới:',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  '1. Yamaha XS115R',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Yamaha XS155R sở hữu ngoại hình đầy phóng khoáng kết hợp khung sườn Deltabox chắc chắn, động cơ 155cc mạnh mẽ, giúp người lái tự tin thể hiện chất riêng và chinh phục mọi chặng đường.',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset(
              imageUrl1,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  '2. Yamaha MT-15',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'MT-15 sở hữu động cơ 155cc tích hợp công nghệ van biến thiên VVA, hộp số 6 cấp và bộ nồi chống trượt, mang lại trải nghiệm tăng tốc siêu nhanh, siêu chuẩn. Cùng bánh xe bản to, rãnh chống trượt dày đặc hỗ trợ di chuyển an toàn, hạn chế trơn trượt.',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset(
              imageUrl2,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  '3. Yamaha YZF-R15',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Yamaha YZF-R15 là sản phẩm cừa có ngoại hình đậm chất thể thao, vừa lắp đặt nhiều linh kiện chất lượng cao cấp. Chẳng hạn như thân xe với thiết kế khí động học giúp tối ưu hóa tốc độ; dung tích lên đến 155cc; phuộc Upside Down tăng độ đàn hồi; bộ ly hợp A&S hạn chế trượt côn...',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset(
              imageUrl3,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
