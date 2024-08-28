import 'package:flutter/material.dart';
import 'package:news/home/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
            width: double.infinity,
            color: AppColors.primaryLightColor,
            child: Text('News App',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(HomeDrawer.categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 10,),
                  Text('categories',
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(HomeDrawer.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text('settings',
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
