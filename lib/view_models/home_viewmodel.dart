import 'package:dio/dio.dart';
import 'package:e_learningapp/models/course.dart';
import 'package:e_learningapp/services/api_services.dart';

class HomeViewModel{
  final ApiService _apiService = ApiService(Dio()..interceptors.add(LogInterceptor()));
  List<Course> dataList = [];

  Future<List<Course>> fetchData() async{
    try {
      final response = await _apiService.fetchData();
      dataList = response.data;
      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}