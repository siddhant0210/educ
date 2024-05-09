
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course{
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;
  final String? category;

  Course({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
    this.category,
  });

  factory Course.fromJson(Map<String , dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}