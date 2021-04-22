import 'dart:convert';

import '../../domain/entity/resultSearch.dart';

class ResultSearchModel extends ResultSearch {
  @override
  final String image;
  @override
  final String title;
  @override
  final String subtitle;

  ResultSearchModel({this.image, this.title, this.subtitle});

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      image: map['image'],
      title: map['title'],
      subtitle: map['subtitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
