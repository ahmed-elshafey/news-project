import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/category.dart';

class CategoryDetails extends StatelessWidget {
  final Category category;
  final Function(News) onNewsItemClick;

  CategoryDetails({required this.category, required this.onNewsItemClick});

  Future<List<News>> fetchNewsByCategory() async {
    try {
      final response = await ApiManager.getNewsBySourceId(category.id);
      if (response != null && response.articles != null) {
        return response.articles!;
      } else {
        throw Exception('No news found for this category');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: fetchNewsByCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          final newsList = snapshot.data!;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return ListTile(
                title: Text(news.title ?? 'No Title'),
                subtitle: Text(news.description ?? 'No Description'),
                onTap: () => onNewsItemClick(news),
              );
            },
          );
        } else {
          return Center(child: Text('No news available'));
        }
      },
    );
  }
}
