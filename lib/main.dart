import 'package:blogone/Models/blogModel.dart';
import 'package:blogone/Screen/FavoriteBlogpage.dart';
import 'package:blogone/Screen/homepage.dart';
import 'package:blogone/Services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // fetchBlogs();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogModelAdapter());
  var box = await Hive.openBox<BlogModel>('saved_blogs');
  // await box.clear();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int index = 0;
  List screen = [HomeScreen(), FavoriteBlogPage()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubSpace"),
      ),
      body: screen[index],
      bottomNavigationBar: NavigationBar(
        height: 80,
        animationDuration: const Duration(seconds: 2),
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
        }),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorite")
        ],
      ),
    );
  }
}
