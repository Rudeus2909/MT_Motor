import 'package:flutter/material.dart';
import 'package:motor_app/ui/news/news_list_view_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.publishDate,
  });

  final String thumbnail;
  final String title;
  final String subtitle;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset(
                thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: NewsListViewTile(
                    title: title, subtitle: subtitle, publishDate: publishDate),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
