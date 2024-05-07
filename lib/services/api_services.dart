import 'package:dio/dio.dart';
import 'package:e_learningapp/networking/course.dart';
import 'package:e_learningapp/networking/user.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://studynotion-backend-ftp3.onrender.com/api/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("login")
  Future<User> login(@Body() Map<String, dynamic> loginData);

  @POST("auth/signup")
  Future<Register> register(@Body() Map<String, dynamic> registerData);
    
  @GET("products")
  Future<List<Course>> fetchData();  
}




// dummy login and sign up api  ->  http://10.0.2.2:4000/api/v1/