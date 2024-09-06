import 'package:movies_app/features/home/data/models/popular_response.dart';

class MoreLikeResponse {
  MoreLikeResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  MoreLikeResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;


}

