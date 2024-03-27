import 'package:flutter/material.dart';

class WinnerV4 extends StatelessWidget {
  const WinnerV4(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Honda Việt Nam giới thiệu WINNER X phiên bản 2024 - Bứt tốc đỉnh cao',
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
                  '09/12/2023 - 10:00',
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
              'Không ngừng nỗ lực mang đến hình ảnh thể thao cuốn hút và cảm giác lái thú vị cho người dùng, ngày 09 tháng 12 năm 2023, HVN chính thức giới thiệu WINNER X 2024 với thông điệp “Bứt tốc đỉnh cao”. Phiên bản mới với những điều chỉnh hấp dẫn trong thiết kế lẫn động cơ, đặc biệt được trang bị công nghệ bộ ly hợp chống trượt hai chiều hoàn toàn mới, hứa hẹn đem đến cho khách hàng cảm giác lái thú vị như ở trên các mẫu xe mô tô thể thao thực thụ.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Loạt cải tiến mới ở thiết kế xe nâng tầm dấu ấn thể thao, chinh phục khách hàng Việt',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'WINNER X 2024 tiếp tục sở hữu thiết kế mạnh mẽ, năng động, nổi bật với những đường nét liền mạch chắc chắn và góc cạnh trên toàn bộ thân xe. Thiết kế nửa thân xe phía trước bề thế với đặc tính khí động học lấy cảm hứng từ hình ảnh của những mẫu mô tô phân khối lớn. Mặt đồng hồ kỹ thuật số dạng âm bản với thiết kế hình khối thể thao nhỏ gọn và hiện đại, mang lại tầm nhìn xuất sắc cho người lái trong mọi điều kiện ánh sáng và cảm giác hưng phấn trong từng khoảnh khắc trải nghiệm.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Với WINNER X phiên bản mới, trọng lượng mâm trước nhẹ hơn 282 gam và mâm sau nhẹ hơn 170 gam so với đời xe 2023, giúp mang lại cảm giác lái linh hoạt hơn, cho phép người dùng dễ dàng điều khiển và chuyển hướng lái.',
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
            const Text(
              'Tính năng vượt trội khẳng định đẳng cấp của chiếc xe côn tay thế hệ mới',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Hệ thống chống bó cứng phanh (ABS) trang bị cho bánh trước trên phiên bản Đặc biệt và phiên bản Thể thao giúp chống khóa cứng bánh xe, đem đến cảm giác lái an toàn cho người dùng, đặc biệt khi phanh gấp ở tốc độ cao hay di chuyển trên mặt đường trơn trượt. Xích có vòng phớt O cũng được duy trì trên phiên bản Đặc biệt và phiên bản Thể thao, góp phần kéo dài tuổi thọ đời xe, tiết kiệm thời gian bảo dưỡng và giúp xe vận hành êm ái hơn.',
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
              'Hệ thống khóa thông minh Honda SMART Key tiếp tục được áp dụng trên cả 3 phiên bản, giúp xác định vị trí xe và mở khóa thông minh từ xa mang đến sự tiện lợi cùng khả năng chống trộm tối ưu. Đặc biệt, ổ khóa thông minh gắn đèn LED xanh có tính năng bật lên khi hoạt động, tăng tính cao cấp và thời trang cho chiếc xe. Cổng sạc USB loại A hiện đại và có nắp chống nước ở phía trước xe vẫn được duy trì trên phiên bản Đặc biệt và Thể thao giúp khách hàng có thể sạc điện thoại một cách tiện lợi khi cần thiết.',
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
