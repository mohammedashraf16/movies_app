import 'package:flutter/material.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/features/home/tabs/watch_list/model/movie_model.dart';

class WatchListProvider extends ChangeNotifier {
  final List<MovieModel> _watchList = [];

  List<MovieModel> get watchList => _watchList;

  bool isMovieInWatchList(String movieId) {
    return _watchList.any((item) => item.id == movieId);
  }

  Future<void> addMovie(MovieModel movie) async {
    try {
      await FirebaseFunctions.addMovie(movie);
      _watchList.add(movie);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to add movie to watch list');
    }
  }

  Future<void> removeMovie(MovieModel movie) async {
    try {
      //await WatchListDataSource.removeMovie(movie);
      _watchList.removeWhere((item) => item.id == movie.id);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to remove movie from watch list');
    }
  }
}