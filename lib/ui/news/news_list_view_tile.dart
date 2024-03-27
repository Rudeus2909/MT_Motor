import 'package:flutter/material.dart';

class NewsListViewTile extends StatelessWidget {
  const NewsListViewTile({super.key, 
    required this.title,
    required this.subtitle,
    required this.publishDate,
  });

  final String title;
  final String subtitle;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Expanded(
          child: Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          publishDate,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
