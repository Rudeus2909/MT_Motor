import 'package:flutter/material.dart';

class SuzukiSale extends StatelessWidget {
  const SuzukiSale({super.key, required this.imageUrl1});

  final String imageUrl1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: 25.0, left: 25.0, top: 10.0, bottom: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Chương trình "Thời tới, chốt xe bao hời"',
              style: Theme.of(context).textTheme.headlineSmall
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '29/11/2023 - 15:20',
                  style: Theme.of(context).textTheme.titleLarge
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
            Text(
              'Chương trình “Thời tới, chốt xe bao hời” với giá trị TỐT NHẤT từ trước đến nay dành cho các dòng xe đang được ưa chuộng, bao gồm: SATRIA F150,  RAIDER R150 và BURGMAN 125',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.red,
                ),
                Text(
                  ' Thời gian khuyến mãi: ',
                  style: Theme.of(context).textTheme.bodyLarge
                  
                ),
                Expanded(
                  child: Text(
                    'Từ 1/12/2023 đến 31/12/2023',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.red,
                ),
                Text(
                  ' Phạm vi áp dụng: ',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Expanded(
                  child: Text(
                    'Tất cả các Đại lý ủy quyền Suzuki trên toàn quốc.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.red,
                ),
                Text(
                  ' Mẫu xe áp dụng: ',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Expanded(
                  child: Text(
                    'SATRIA F150, RAIDER R150, BURGMAN 125',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.red,
                ),
                Text(
                  ' Nội dung khuyến mãi: ',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Expanded(
                  child: Text(
                    'Tất cả khách hàng mua các mẫu xe trên đều được Suzuki áp dụng gói hỗ trợ, có thể quy đổi bằng tiền mặt.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.motorcycle_outlined,
                  color: Colors.blue,
                ),
                Text(
                  ' SATRIA F150: ',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Expanded(
                  child: Text(
                    'Gói hỗ trợ trị giá 6.000.000 VNĐ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.motorcycle_outlined,
                  color: Colors.blue,
                ),
                Text(
                  ' RAIDER R150: ',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Expanded(
                  child: Text(
                    'Gói hỗ trợ trị giá 6.000.000 VNĐ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.motorcycle_outlined,
                  color: Colors.blue,
                ),
                Text(
                  ' BURGMAN 125: ',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                Expanded(
                  child: Text(
                    'Gói hỗ trợ trị giá 8.000.000 VNĐ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
