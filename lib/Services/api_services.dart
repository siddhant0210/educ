import 'package:dio/dio.dart';
import 'package:e_learningapp/Networking/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://your.api.base.url/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("login")
  Future<User> login(@Body() Map<String, dynamic> loginData);
}
