import 'package:flutter/material.dart';
import '../../../components/image_header_default.dart';
import '../../../components/subtitle_widget.dart';
import '../../task/components/list.dart';
import '../../../components/title_widget.dart';
import '../../../routes/routes_generator.dart';
import '../../../shared/constants.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required String userName}) : _userName = userName, super(key: key);
  const MyHomePage({super.key, required String userName})
      : _userName = userName;

  final String _userName;
  get name => _userName;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  //image: AssetImage
                  image: AssetImage(
                    'assets/images/logomenu.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: SizedBox.shrink(),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text(AppConstants.login),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.loginPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books_sharp),
              title: const Text(AppConstants.level),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.levelPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(AppConstants.category),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.categoryPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.toc_outlined),
              title: const Text(AppConstants.about),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.aboutPage);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ImageHeaderDefault(),
        //title: Image.network(
        //  'https://cdn1.iconfinder.com/data/icons/sharovar-outline/128/Pie_chart-512.png',
        //),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // padding: EdgeInsets.symmetric(),
          // padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubtitleDefault(title: AppConstants.welcome),
              TitleDefault(title: widget.name),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListActivities(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar a página de cadastro
          Navigator.of(context).pushNamed(RoutesGenerator.addPage);
        },
        tooltip: AppConstants.newPage,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
