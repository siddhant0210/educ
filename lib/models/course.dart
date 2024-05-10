import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class CourseResponse {
  final bool? success;
  final List<Course>? data;

  CourseResponse({
     this.success,
     this.data,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) => _$CourseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}

@JsonSerializable()
class Course {
  final String? id;
  final String? courseName;
  final Instructor? instructor;
  final List<RatingAndReview>? ratingAndReviews;
  final double? price;
  final String? thumbnail;

  Course({
     this.id,
     this.courseName,
     this.instructor,
     this.ratingAndReviews,
     this.price,
     this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class Instructor {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? accountType;
  final String? additionalDetails;
  final List<String>? courses;
  final String? image;
  final bool? active;
  final List<dynamic>? courseProgress;
  final String? resetPasswordExpires;
  final String? token;

  Instructor({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
     this.password,
     this.accountType,
     this.additionalDetails,
     this.courses,
     this.image,
     this.active,
     this.courseProgress,
     this.resetPasswordExpires,
     this.token,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => _$InstructorFromJson(json);
  Map<String, dynamic> toJson() => _$InstructorToJson(this);
}

@JsonSerializable()
class RatingAndReview {
  final String? id; 

  RatingAndReview({
     this.id,
  });

  factory RatingAndReview.fromJson(Map<String, dynamic> json) => _$RatingAndReviewFromJson(json);
  Map<String, dynamic> toJson() => _$RatingAndReviewToJson(this);
}
