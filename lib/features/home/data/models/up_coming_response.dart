
import 'package:movies_app/features/home/data/models/popular_response.dart';

class UpComingResponse {
  UpComingResponse( {
      this.dates, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  UpComingResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

}


class Dates {
  Dates({
      this.maximum, 
      this.minimum,});

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;


}