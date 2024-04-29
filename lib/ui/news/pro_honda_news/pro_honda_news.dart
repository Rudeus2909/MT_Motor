import 'package:flutter/material.dart';

class ProHondaNews extends StatelessWidget {
  const ProHondaNews({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: 25.0, left: 25.0, bottom: 30.0, top: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dầu nhờn toàn cầu Pro Honda - Bạn đường lý tưởng cho xe Honda',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '2 ngày trước - 14:14',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Với mong muốn đồng hành cùng bạn và chiếc xe trong cuộc sống hằng ngày, Honda ra mắt thương hiệu dầu nhờn toàn cầu ProHonda. Sự ra mắt của thương hiệu toàn cầu này là lời khẳng định và cam kết của Honda về chất lượng và khả năng tương thích vượt trội của sản phẩm với động cơ Honda.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Hôm nay, HVN chính thức giới thiệu thương hiệu dầu nhờn toàn cầu ProHonda với 3 dòng sản phẩm chuyên biệt cho xe số, xe ga và xe côn tay.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.electric_bolt_sharp,
                  color: Colors.amber,
                ),
                Text(
                  'Tương thích tuyệt đối với động cơ Honda',
                  style: Theme.of(context).textTheme.bodyLarge
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
                  Icons.electric_bolt_sharp,
                  color: Colors.amber,
                ),
                Text(
                  'Chất lượng toàn cầu',
                  style: Theme.of(context).textTheme.bodyLarge
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
                  Icons.electric_bolt_sharp,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 330,
                  child: Text(
                    '"Bền bỉ", "Tiết kiệm nhiên liệu", và "Tiết kiệm chi phí"',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                  Icons.electric_bolt_sharp,
                  color: Colors.amber,
                ),
                Text(
                  '"Thân thiện" và "Xanh"',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'HVN hy vọng Pro Honda sẽ mang tới trải nghiệm lái xe êm ái, thú vị, cảm giác an toàn, chắc chắn, và trên hết, trở thành người bạn đồng hành tin cậy để truyền cảm hứng, cùng bạn tiến lên phía trước trên hành trình theo đuổi đam mê.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
