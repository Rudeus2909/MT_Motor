import 'package:flutter/material.dart';

class PG1 extends StatelessWidget {
  const PG1(
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
        right: 25.0,
        left: 25.0,
        top: 10.0,
        bottom: 30.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Đánh giá xe Yamaha PG-1: Kiểu dáng, vận hành và giá cả',
              style: Theme.of(context).textTheme.headlineSmall
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '26/01/2024 - 19:45',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Vừa qua, Yamaha Motor Việt Nam ra mắt mẫu xe PG-1 có kiểu dáng phá cách, thu hút sự chú ý từ rất nhiều bạn trẻ. Hãy cùng theo dõi bài viết để xem siêu phẩm mới của Yamaha nổi bật như nào nhé!',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  '1. Kiểu dáng thiết kế',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Yamaha PG-1 có kích thước dài, rộng và cao lần lượt là 1980mm x 805mm x 1050mm, độ cao yên 795mm, trọng lượng 107kg.',
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
            Text(
              'Ngoài ra, xe có thiết kế đèn pha tròn mang phong cách cổ điển, ghi đông nhẹ phục vụ cho nhiều tư thế lái thoải mái, bộ lốp gai bản to và hoa văn hình khối cứng cáp không chỉ thể hiện cá tính mạnh mẽ mà còn mang lại sự cân bằng trên nhiều điều kiện mặt đường.',
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
                  '2. Tính năng, hiệu suất vận hành',
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Sức nóng của Yamaha PG-1 không chỉ thể hiện ở thiết kế độc đáo, mà còn bởi trải nghiệm lái mạnh mẽ và linh hoạt, cả đi trong phố hay phượt đường dài.',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Mẫu xe được trang bị động cơ xi-lanh đơn dung tích 115 phân khối, làm mát bằng gió, công suất 8,8 mã lực tại 7.000 vòng/phút, mô-men xoắn cực đại 9,5 Nm tại 5.500 vòng/phút, kết hợp hộp số 4 cấp.',
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
