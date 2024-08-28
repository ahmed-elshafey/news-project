import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "news_details_screen";

  final News news;

  NewsDetailsScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? 'News Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage != null)
              Image.network(news.urlToImage!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title ?? 'No Title',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    news.content ?? 'No Content',
                    style: TextStyle(fontSize: 18),
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
