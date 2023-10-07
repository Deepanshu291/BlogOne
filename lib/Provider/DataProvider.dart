

import 'package:blogone/Services/apiservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final BlogDataProvider = FutureProvider((ref) async {
  return await ref.watch(blogProvider).fetchBlogs();
});

