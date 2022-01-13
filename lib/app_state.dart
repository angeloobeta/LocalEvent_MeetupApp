import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryId = 0;

  void updatedCategory(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}
