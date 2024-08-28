import 'package:flutter/material.dart';
import 'package:news/home/category/category_item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your Category\nof Interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    var selectedCategory = categoriesList[index];
                    if (selectedCategory != null) {
                      onCategoryItemClick(selectedCategory);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid category selected')),
                      );
                    }
                  },
                  child: CategoryItem(category: categoriesList[index], index: index),
                );
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}

