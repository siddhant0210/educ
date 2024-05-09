import 'package:dio/dio.dart' hide Headers;
import 'package:e_learningapp/models/course.dart';
import 'package:e_learningapp/models/user.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://studynotion-backend-ftp3.onrender.com/api/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("auth/login")
  Future<User> login(@Body() Map<String, dynamic> loginData);

  @POST("auth/signup")
  Future<Register> register(@Body() Map<String, dynamic> registerData);

  @POST("auth/sendOtp")
  Future<Otp> otp(@Body() Map<String, dynamic> otpData);

  @GET("auth/getAllCourses")
  Future<List<Course>> fetchData();  
}




// dummy login and sign up api  ->  http://10.0.2.2:4000/api/v1/