import 'package:blogone/Components/Blogcard.dart';
import 'package:blogone/Components/loading.dart';
import 'package:blogone/Models/blogModel.dart';
import 'package:blogone/Provider/DataProvider.dart';
import 'package:blogone/Services/favroiteblog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteBlogPage extends ConsumerStatefulWidget {
  const FavoriteBlogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoriteBlogPageState();
}

class _FavoriteBlogPageState extends ConsumerState<FavoriteBlogPage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder<Box<BlogModel>>(
      valueListenable:
          ref.read(favoriteBlogsProvider.notifier).getData().listenable(),
      builder: (context, value, child) {
        final data = value.values.toList().cast<BlogModel>();
        return Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                ref.read(favoriteBlogsProvider.notifier).deleteAllblog();
                setState(() {
                  
                });
              },
              icon: Icon(Icons.delete),
              label: Text("DeleteAll"),
            ),
            Expanded(
                child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: ListView.builder(
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  print(data[index].isFav);
                  return BlogCard(blog: data[index]);
                },
              ),
            )),
          ],
        );
      },
    );
   
   
  }
}
