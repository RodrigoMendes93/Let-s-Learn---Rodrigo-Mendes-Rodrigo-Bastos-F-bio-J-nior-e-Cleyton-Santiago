import '../../task/services/task_service.dart';

class HomeController {
  //
  // Classe responsável pelo interação dos dados e a página
  //
  final ActivityService _ActivityService;

  HomeController({required ActivityService ActivityService})
      : _ActivityService = ActivityService;

  getActivities() {
    return _ActivityService.getActivity();
  }
}
