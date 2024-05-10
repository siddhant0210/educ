// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String?,
      courseName: json['courseName'] as String?,
      instructor: json['instructor'] == null
          ? null
          : Instructor.fromJson(json['instructor'] as Map<String, dynamic>),
      ratingAndReviews: (json['ratingAndReviews'] as List<dynamic>?)
          ?.map((e) => RatingAndReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'courseName': instance.courseName,
      'instructor': instance.instructor,
      'ratingAndReviews': instance.ratingAndReviews,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
    };

Instructor _$InstructorFromJson(Map<String, dynamic> json) => Instructor(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      accountType: json['accountType'] as String?,
      additionalDetails: json['additionalDetails'] as String?,
      courses:
          (json['courses'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
      active: json['active'] as bool?,
      courseProgress: json['courseProgress'] as List<dynamic>?,
      resetPasswordExpires: json['resetPasswordExpires'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$InstructorToJson(Instructor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'accountType': instance.accountType,
      'additionalDetails': instance.additionalDetails,
      'courses': instance.courses,
      'image': instance.image,
      'active': instance.active,
      'courseProgress': instance.courseProgress,
      'resetPasswordExpires': instance.resetPasswordExpires,
      'token': instance.token,
    };

RatingAndReview _$RatingAndReviewFromJson(Map<String, dynamic> json) =>
    RatingAndReview(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RatingAndReviewToJson(RatingAndReview instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
