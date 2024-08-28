import 'package:flutter/material.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/home/category/category_fragment.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/settings/settings_tab.dart';
import 'package:news/model/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;
  int selectedItem = HomeDrawer.categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedItem == HomeDrawer.settings
              ? 'Settings'
              : selectedCategory == null
              ? 'News App'
              : selectedCategory!.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      drawer: Drawer(
        child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClicked),
      ),
      body: selectedItem == HomeDrawer.settings
          ? SettingsTab()
          : selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClicked)
          : CategoryDetails(category: selectedCategory!, onNewsItemClick: (News ) {  },),
    );
  }

  void onCategoryItemClicked(Category newCategory) {
    setState(() {
      selectedCategory = newCategory;
    });
  }

  void onSideMenuItemClicked(int newSelectedItem) {
    setState(() {
      selectedItem = newSelectedItem;
      selectedCategory = null;
    });
    Navigator.pop(context);
  }
}
