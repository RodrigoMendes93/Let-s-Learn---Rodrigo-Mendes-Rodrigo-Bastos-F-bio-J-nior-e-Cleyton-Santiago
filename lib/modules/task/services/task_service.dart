import 'package:minhas_financas/modules/category/models/category_model.dart';
import '../models/task_model.dart';
import '../../category/services/category_service.dart';

class ActivityService {
  final CategoryService _categoryService;

  ActivityService({required CategoryService categoryService})
      : _categoryService = categoryService;

  ///
  /// Classe responsável por interagir com a fonte dos dados
  ///
  List<Activity> getActivity() {
    return List.generate(
      10,
      (index) {
        final categories = _categoryService.getCategories();
        return Activity(
          title: 'Atividade $index',
          description: 'Atividade para estudantes do Nível $index',
          category: categories.isNotEmpty
              ? categories[index % categories.length]
              : Category.empty,
          finished: index.isEven,
        );
      },
    );
  }
}
