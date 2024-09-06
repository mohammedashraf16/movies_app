import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/details/model/DetailsResponse.dart';
import 'package:movies_app/features/home/data/models/DiscoverMovieResponse.dart';
import 'package:movies_app/features/home/data/models/GenreResponse.dart';
import 'package:movies_app/features/home/data/models/more_like_response.dart';
import 'package:movies_app/features/home/data/models/recommending_response.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/data/models/up_coming_response.dart';
import 'package:movies_app/features/home/tabs/search/model/SearchModel.dart';

class ApiManager {
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYjc0YmY3NDViYzZmZDVmY2ZiMTU5NzBkNzI4YzE2OSIsIm5iZiI6MTcyNDU3Nzk0Mi45NjcyMDMsInN1YiI6IjY2Y2FmMzM4ZTRkNzM0ZjhjZjc0OTljOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.isgcueYmOLQhXUAJNbi0m88kf1pCMjMA_sTK-dLZxzY',
    'accept': 'application/json',
  };

  static Future<PopularResponse> getPopularResponse() async {
    // https://api.themoviedb.org/3/movie/popular
    Uri url = Uri.https(Constants.baseUrl, Constants.endPoint);
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    PopularResponse popularResponse = PopularResponse.fromJson(jsonFormat);
    return popularResponse;
  }

  static Future<UpComingResponse> getUpComingResponse() async {
    // https://api.themoviedb.org/3/movie/upcoming
    Uri url = Uri.https(Constants.baseUrl, Constants.upcomingEndPoint);
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> json = jsonDecode(response.body);
    UpComingResponse upComingResponse = UpComingResponse.fromJson(json);
    return upComingResponse;
  }

  static Future<RecommendingResponse> getRecommendingResponse() async {
    // https://api.themoviedb.org/3/movie/top_rated
    Uri url = Uri.https(Constants.baseUrl, Constants.recommendingEndPoint);
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> json = jsonDecode(response.body);
    RecommendingResponse recommendingResponse =
        RecommendingResponse.fromJson(json);
    return recommendingResponse;
  }

  static Future<DetailsResponse> getDetailsResponse(int movieId) async {
    // https://api.themoviedb.org/3/movie/{movie_id}
    Uri url = Uri.https(Constants.baseUrl, "/3/movie/$movieId");
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> json = jsonDecode(response.body);
    DetailsResponse detailsResponse = DetailsResponse.fromJson(json);
    return detailsResponse;
  }

  static Future<MoreLikeResponse> getSimilarResponse(int movieId) async {
    // https://api.themoviedb.org/3/movie/{movie_id}/similar/similar
    Uri url = Uri.https(Constants.baseUrl, "/3/movie/$movieId/similar");
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> json = jsonDecode(response.body);
    MoreLikeResponse moreLikeResponse = MoreLikeResponse.fromJson(json);
    return moreLikeResponse;
  }

  static Future<SearchModel> getSearchResponse({required String query}) async {
    Uri url = Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=da6ff057b1fb87fab15bcd3d5693722f&query=$query)");
    http.Response response = await http.get(url, headers:headers);
    if(response.statusCode==200){
      Map<String, dynamic> json = jsonDecode(response.body);
      SearchModel searchResponse = SearchModel.fromJson(json);
      return searchResponse;
    }else if(response.statusCode==400){
      throw Exception('Bad Request');
    }
    else{
      throw Exception('Failed to load search movies');
    }

  }

  static Future<GenreResponse> getGenreResponse() async {
    // https://api.themoviedb.org/3/genre/movie/list
    Uri url = Uri.https(Constants.baseUrl, Constants.genreEndPoint);
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> json = jsonDecode(response.body);
    GenreResponse genreResponse = GenreResponse.fromJson(json);
    return genreResponse;
  }

  static Future<DiscoverMovieResponse> getDiscoverMovieResponse( int id) async {
    // https://api.themoviedb.org/3/discover/movie
    Uri url = Uri.https(Constants.baseUrl,Constants.discoverEndPoint,{
      'with_genres':id.toString()
    });
    http.Response response=await http.get(url,headers: headers);
    Map<String,dynamic> json =jsonDecode(response.body);
    DiscoverMovieResponse discoverMovieResponse =DiscoverMovieResponse.fromJson(json);
    return discoverMovieResponse;
  }
}
