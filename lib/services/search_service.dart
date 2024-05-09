import 'package:dio/dio.dart';
import 'package:e_learningapp/models/search.dart';
import 'package:retrofit/http.dart';

part 'search_service.g.dart';


@RestApi(baseUrl: "https://dummyapi.online/api/")
abstract class SearchService{
  factory SearchService(Dio dio , {String baseUrl}) = _SearchService;

  @GET("pokemon")
  Future<List<Search>> searchPokemon(@Query("query") String query);

  @GET("pokemon/{id}")
  Future<Search> getPokemonDetails(@Path("id") int id);
}
