import 'package:flutter/material.dart';
import '../../../components/subtitle_widget.dart';
import '../../../components/title_widget.dart';
import '../models/task_model.dart';
import '../../category/services/category_service.dart';
import '../../../shared/styles.dart';
import '../../home/controllers/home_controller.dart';
import '../services/task_service.dart';
import '../../../shared/constants.dart';

class ListActivities extends StatefulWidget {
  const ListActivities({super.key});

  @override
  State<ListActivities> createState() => _ListActivityState();
}

class _ListActivityState extends State<ListActivities> {
  // Instância de controller
  final controller = HomeController(
    ActivityService: ActivityService(
      categoryService: CategoryService(),
    ),
  );
  List<Activity> activities;

  _ListActivityState() : activities = [];

  @override
  void initState() {
    // Pega a lista de tarefas
    activities = controller.getActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleDefault(title: AppConstants.nextTasks),
        Expanded(
          child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (_, index) {
              return Row(
                children: [
                  // Circulo
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //Texto com título e subtitulo
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleDefault(title: activities[index].title),
                          SubtitleDefault(title: activities[index].description),
                        ],
                      ),
                    ),
                  ),
                  //Checkbox
                  Checkbox(
                    side: const BorderSide(
                      color: AppStyle.primaryColor,
                      width: 2,
                    ),
                    activeColor: AppStyle.primaryColor,
                    value: activities[index].finished,
                    onChanged: (value) {
                      setState(() {
                        activities[index] = activities[index].copyWith(finished: value);
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
