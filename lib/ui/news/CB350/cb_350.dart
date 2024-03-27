import 'package:flutter/material.dart';

class CB350 extends StatelessWidget {
  const CB350(
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
          right: 25.0, left: 25.0, top: 10.0, bottom: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Honda Việt Nam ra mắt mẫu xe CB350 H`ness',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '09/12/2023 - 12:00',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black54,
                  ),
                ),
              ],
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
            const Text(
              'Luôn lắng nghe nhu cầu và tâm lý của khách hàng từ đó mang đến niềm vui thực sự trên từng cung đường, HVN chính thức giới thiệu mẫu xe CB350 H`ness tại thị trường Việt Nam, hứa hẹn sẽ trở thành một biểu tượng của phong cách hoài cổ, niềm tự hào cho các tay lái đam mê sự mạnh mẽ, thoải mái mà đậm “chất riêng thời đại”.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              children: [
                Text(
                  'Động cơ mạnh mẽ, trải nghiệm lái ấn tượng',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Trái tim CB350 nằm ở động cơ dung tích 350cc, 4 kỳ, xi lanh đơn, làm mát bằng không khí với công suất cực đại mạnh mẽ đạt 15,5kW tại 5.500 vòng/phút và mô-men xoắn cực đại 30Nm tại 3.000 vòng/phút. Mang lại khả năng vận hành êm ái, tăng tốc nhẹ nhàng, sự linh hoạt tuyệt vời cho người lái khi di chuyển trong nội đô cũng như những chuyến đi dài dịp cuối tuần.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
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
            const Row(
              children: [
                Text(
                  'Công nghệ hiện đại dẫn đầu phân khúc',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            
            const Text(
              'Được trang bị công nghệ, tiện ích tối tân, CB350 H`ness chính là trợ thủ đắc lực trên mọi cung đường, cho mọi tay lái từ đã có kinh nghiệm hay mới làm quen với xe phân khối lớn.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset(
              imageUrl3,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'CB350 H`ness sở hữu hệ thống ly hợp hỗ trợ và chống trượt giúp tránh hiện tượng khóa bánh sau do lực phanh động cơ gây ra khi về số đột ngột, đồng thời giúp tay côn nhẹ hơn và bộ ly hợp vận hành mượt mà hơn. Trang bị đồng bộ phanh đĩa trước đường kính 310mm, phanh đĩa sau đường kính 240mm được tích hợp hệ thống ABS 2 kênh giúp kiểm soát hiệu quả tốc độ của xe, ngăn ngừa hiện tượng khóa bánh trong các tình huống phanh khẩn cấp.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
