// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';
part 'blogModel.g.dart';

@HiveType(typeId: 0)
class BlogModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String title;

  @HiveField(3, defaultValue: false)
  bool isFav;

  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.isFav = false 
  });

  BlogModel copyWith({
    String? id,
    String? imageUrl,
    String? title,
    bool? isFav
  }) {
    return BlogModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      isFav: isFav ?? this.isFav
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] as String,
      imageUrl: map['image_url'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory BlogModel.fromJson(String source) => BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);
  factory BlogModel.fromJson(Map<String, dynamic> jsonData) {
    return BlogModel(
      id: jsonData['id'] ?? " ",
      title: jsonData['title'] ?? "",
      imageUrl: jsonData['image_url'] ?? "",
    );
  }
}
