import 'package:blogone/Components/Blogcard.dart';
import 'package:blogone/Components/loading.dart';
import 'package:blogone/Models/blogModel.dart';
import 'package:blogone/Provider/DataProvider.dart';
import 'package:blogone/Services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final scrollController = ScrollController();
  var refreshkey = GlobalKey<RefreshIndicatorState>();

  Future<void> refresh() async {
    ref.read(blogProvider).fetchBlogs();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ref.watch(BlogDataProvider).when(
          data: (data) {
            return Scaffold(
              body: RefreshIndicator(
                  onRefresh: refresh,
                  key: refreshkey,
                  child: _homeWidget(
                      data: data,
                      size: size,
                      scrollController: scrollController)),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Loader(),
        );
  }
}

class _homeWidget extends StatelessWidget {
  const _homeWidget({
    super.key,
    required this.size,
    required this.scrollController,
    required this.data,
  });

  final Size size;
  final ScrollController scrollController;
  final List<BlogModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
            child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: ListView.builder(
            controller: scrollController,
            physics:const AlwaysScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              // print(data);
              return BlogCard(blog: data[index]);
            },
          ),
        )),
      ],
    );
  }
}
