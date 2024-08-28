import 'package:flutter/material.dart';
import 'package:news/home/news_details_screen.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/category.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  final int index;

  CategoryItem({required this.category, required this.index});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          NewsDetailsScreen.routeName,
          arguments: widget.index,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.category.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(widget.index % 2 == 0 ? 25 : 0),
            bottomRight: Radius.circular(widget.index % 2 == 0 ? 0 : 25),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.category.imagePath,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text(
              widget.category.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  void onNewsItemClick(News news) {
    Navigator.pushNamed(
      context,
      NewsDetailsScreen.routeName,
      arguments: news,
    );
  }
}


