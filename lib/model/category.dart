import 'dart:ui';

import 'package:news/home/app_colors.dart';

class Category{
  String id,title,imagePath;
  Color color;
  Category({required this.id,required this.title,required this.imagePath,required this.color});
  static List<Category> getCategories (){
    return [
      /*
          science
       */
      Category(id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          color: AppColors.redColor
      ),
      Category(id: 'general',
          title: 'General',
          imagePath: 'assets/images/Politics.png',
          color: AppColors.darkBlueColor
      ),
      Category(id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: AppColors.pinkColor
      ),
      Category(id: 'business',
          title: 'Bussines',
          imagePath: 'assets/images/bussines.png',
          color: AppColors.brownColor
      ),
      Category(id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: AppColors.blueColor
      ),
      Category(id: 'science',
          title: 'Technology',
          imagePath: 'assets/images/science.png',
          color: AppColors.darkBlueColor
      ),
    ];
}
}