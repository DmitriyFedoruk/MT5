import 'package:flutter/rendering.dart';

class Model {
  final String id;
  final String image;
  final String title;

  Model({this.id, this.image, this.title});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      );
  }
}