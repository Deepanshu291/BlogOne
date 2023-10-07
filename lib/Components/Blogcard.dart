import 'package:blogone/Models/blogModel.dart';
import 'package:blogone/Screen/BlogPage.dart';
import 'package:blogone/Services/favroiteblog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogCard extends ConsumerStatefulWidget {
  
  String img = 'https://www.mtu.edu.np/images/noimg.png';
  BlogCard({super.key, required this.blog});
  BlogModel blog;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlogCardState();
}

class _BlogCardState extends ConsumerState<BlogCard> {
  late final imgurl = widget.blog.imageUrl;

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteBlogsProvider).contains(widget.blog);
    return GestureDetector(
      onTap: () {
        print(widget.blog.isFav);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogPage(blog: widget.blog)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Card(
          elevation: 10,
          shadowColor: Colors.deepPurple.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.deepPurpleAccent.shade700,
                    Colors.purple.shade900
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    imageUrl: imgurl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    useOldImageOnUrlChange: true,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.blog.title,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(favoriteBlogsProvider.notifier)
                                .toggleFavorite(widget.blog);
                            setState(() {
                              widget.blog.copyWith(isFav: !widget.blog.isFav);
                              
                            });
                          },
                          icon: Icon(
                            isFavorite || widget.blog.isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite || widget.blog.isFav
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

