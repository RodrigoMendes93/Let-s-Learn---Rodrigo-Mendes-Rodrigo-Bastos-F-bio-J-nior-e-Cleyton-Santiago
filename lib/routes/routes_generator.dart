import 'package:flutter/material.dart';
import 'package:minhas_financas/modules/category/pages/edit_category.dart';
import '../modules/category/controllers/category_controller.dart';
import '../modules/category/models/category_model.dart';
import '../modules/category/pages/add_category.dart';
import '../modules/category/services/category_service.dart';
import '../modules/home/pages/about.dart';
import '../modules/home/pages/login.dart';
import '../modules/category/pages/category.dart';
import '../modules/home/pages/add_click.dart';
import '../modules/home/pages/home.dart';
import '../shared/constants.dart';

class RoutesGenerator {
  static const levelPage = '/';
  static const addPage = '/clique/add';
  static const aboutPage = '/about';
  static const categoryPage = '/category';
  static const loginPage = '/login';
  static const addCategoryPage = '$categoryPage/add';
  static const editCategoryPage = '$categoryPage/edit';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    final categoryService = CategoryService();
    final categoryController = CategoryController(
      categoryService: categoryService,
    );

    switch (settings.name) {
      case levelPage:
        return _goPage(const MyHomePage(userName: 'Student'));
      case addPage:
        return _goPage(const AddClickPage());
      case aboutPage:
        return _goPage(const AboutPage());
      case categoryPage:
        return _goPage(CategoryPage(controller: categoryController));
      case loginPage:
        return _goPage(LoginPage());
      case addCategoryPage:
        return _goPage(CategoryAddPage(categoryController: categoryController));
      case editCategoryPage:
        // cast do argumento para o tipo Category
        final Category category = settings.arguments as Category;
        return _goPage(
          CategoryEditPage(
            categoryController: categoryController,
            category: category,
          ),
        );
      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
