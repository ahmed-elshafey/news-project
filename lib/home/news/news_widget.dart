import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/app_colors.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/SourceResponse.dart';

class NewsWidget extends StatelessWidget {
  Source source;
  NewsWidget({required this.source});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourceId(source.id??''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(source.id??'');
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          }

          if (snapshot.data!.status == 'error') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news:newsList[index]);
          },
          itemCount: newsList.length,
          );
        }
    );
    }
  }
