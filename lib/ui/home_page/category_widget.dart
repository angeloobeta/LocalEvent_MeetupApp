import 'package:flutter/material.dart';
import 'package:local_event_meetup/app_state.dart';
import 'package:local_event_meetup/styleguide.dart';
import 'package:provider/provider.dart';
import '../../model/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) appState.updatedCategory(category.categoryId);
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: isSelected ? Colors.white : Colors.transparent),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(category.icon,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    size: 35),
                Text(
                  category.name,
                  style: isSelected
                      ? selectedCategoryTextStyle
                      : categoryTextStyle,
                ),
              ]),
        ),
      ),
    );
  }
}
