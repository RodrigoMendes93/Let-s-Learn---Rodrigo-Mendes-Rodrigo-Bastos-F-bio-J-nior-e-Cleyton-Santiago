import '../models/category_model.dart';

import '../services/category_service.dart';

class CategoryController {
  final CategoryService _categoryService;

  CategoryController({required CategoryService categoryService})
      : _categoryService = categoryService;

  List<Category> getCategories() => _categoryService.getCategories();

  String? saveCategory(String name, int color, String? description) {
    return _categoryService.save(
      Category(
        name: name,
        color: color,
        description: description,
      ),
    );
  }

  void remove(int index) {
    _categoryService.remove(index);
  }
}
