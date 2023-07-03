import '../../category/models/category_model.dart';

class Activity {
  final String title;
  final String description;
  final bool finished;
  final Category category;

  Activity({
    required this.title,
    required this.description,
    required this.category,
    bool? finished,
  }) : finished = finished ?? false;

  /// Cria uma Task a partir da atual trocando os valores passados
  copyWith({
    String? title,
    String? description,
    Category? category,
    bool? finished,
  }) =>
      Activity(
        category: category ?? this.category,
        title: title ?? this.title,
        description: description ?? this.description,
        finished: finished ?? this.finished,
      );
}
