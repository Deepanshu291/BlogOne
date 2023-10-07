import 'package:blogone/Models/blogModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

// Assuming you already have BlogModel, FavoriteBlogsNotifier, and other code...

class BlogPage extends StatelessWidget {
  final BlogModel blog;

  BlogPage({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(20),
               child: CachedNetworkImage(
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
                imageUrl: blog.imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child:
                      CircularProgressIndicator(value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                useOldImageOnUrlChange: true,
                         ),
             ),
            const SizedBox(height: 16),
            Text(
              blog.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              // Assuming your BlogModel has a 'content' property
              blog.title,
              style:const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
