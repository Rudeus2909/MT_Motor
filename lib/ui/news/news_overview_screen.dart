import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/CB350/cb_350_screen.dart';
import 'package:motor_app/ui/news/PG-1/pg_1_screen.dart';
import 'package:motor_app/ui/news/WinnerV4/winner_v4_screen.dart';
import 'package:motor_app/ui/news/pro_honda_news/pro_honda_news_screen.dart';
import 'package:motor_app/ui/news/suzuki_sale/suzuki_sale_screen.dart';
import 'package:motor_app/ui/news/top3moto/top_3_moto_news_screen.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'news_list_view.dart';

class NewsOverviewScreen extends StatelessWidget {
  const NewsOverviewScreen({super.key});

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
                    title: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Tin tức và khuyến mãi',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const NewsListView(
                        thumbnail: 'assets/news/ProHonda.jpg',
                        title: 'Tin tức mới của Honda',
                        subtitle:
                            'Dầu nhờn toàn cầu ProHonda - Bạn đường lý tưởng cho xe Honda',
                        publishDate: '2 ngày trước'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                              builder: (BuildContext context) =>
                                  const ProHondaNewsScreen()));
                    },
                  ),
                  ListTile(
                    title: const NewsListView(
                        thumbnail: 'assets/news/Top3Moto.jpg',
                        title:
                            '3 mẫu xe dưới 100 triệu đáng sở hữu nhất hiện nay',
                        subtitle:
                            'Hiện tại, trên thị trường có rất nhiều dòng xe moto ở nhiều phân khúc giá khác nhau...',
                        publishDate: '26/01/2024'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Top3MotoScreen()));
                    },
                  ),
                  ListTile(
                    title: const NewsListView(
                        thumbnail: 'assets/news/PG-1.jpg',
                        title: 'Đánh giá xe Yamaha PG-1',
                        subtitle:
                            'Mẫu xe Yamaha PG-1 vừa ra mắt có kiểu dáng phá cách, thu hút nhiều sự chú ý',
                        publishDate: '26/01/2024'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const PG1Screen()));
                    },
                  ),
                  ListTile(
                    title: const NewsListView(
                        thumbnail: 'assets/news/CB350.jpg',
                        title: 'Honda Việt Nam ra mắt mẫu xe CB350 H`ness',
                        subtitle:
                            'Mẫu xe mới ra mắt của nhà Honda: CB350 H`ness với kiểu dáng classic',
                        publishDate: '09/12/2023'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CB350Screen()));
                    },
                  ),
                  ListTile(
                    title: const NewsListView(
                        thumbnail: 'assets/news/WinnerV4.jpg',
                        title: 'Tin tức mới của Honda',
                        subtitle:
                            'Honda Việt Nam giới thiệu Winner X phiên bản 2024 - Bứt tốc đỉnh cao',
                        publishDate: '09/12/2023'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const WinnerV4Screen()));
                    },
                  ),
                  ListTile(
                    title: const NewsListView(
                        thumbnail: 'assets/news/SuzukiSale.webp',
                        title: 'Chương trình "Thời tới, chốt xe bao hời"',
                        subtitle:
                            'Ưu đãi tốt nhất từ trước đến nay danh cho các dòng xe Suzuki đang được ưa chuộng',
                        publishDate: '29/11/2023'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SuzukiSaleScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
