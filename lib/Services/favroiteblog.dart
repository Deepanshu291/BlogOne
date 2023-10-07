import 'package:blogone/Models/blogModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod/riverpod.dart';

final favoriteBlogsProvider =
    StateNotifierProvider<FavoriteBlogsNotifier, List<BlogModel>>(
  (ref) => FavoriteBlogsNotifier(),
);

class FavoriteBlogsNotifier extends StateNotifier<List<BlogModel>> {
  FavoriteBlogsNotifier() : super([]);

  Box<BlogModel> getData() => Hive.box<BlogModel>('saved_blogs');

  bool toggleFavorite(BlogModel blog) {
    // final isFav = state.contains(blog);

    blog.isFav = !blog.isFav;
    print(getData());
    if (state.contains(blog)) {
      state = state..remove(blog);
      blog.isFav = false;
      deleteblog(blog);
      return false; // Blog removed from favorites
    } else {
      state = state..add(blog);
      blog.isFav = true;
      saveblog(blog);
      return true; // Blog added to favorites
    }
  }

  void saveblog(BlogModel blog) {
    getData().add(blog);
    blog.save();
  }

  void deleteblog(BlogModel blog) {
    getData().delete(blog);
    blog.delete();
  }

  void deleteAllblog() {
    getData().clear();
    
  }
}
