import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/features/home/tabs/watch_list/model/movie_model.dart';

class FirebaseFunctions {
  static CollectionReference<MovieModel> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection("Movies")
        .withConverter<MovieModel>(
      fromFirestore: (snapshot, _) {
        return MovieModel.fromJson(snapshot.data()!);
      },
      toFirestore: (movieModel, _) {
        return movieModel.toJson();
      },
    );
  }

  static Future<void> addMovie(MovieModel model) async {
    var collection = getMoviesCollection();
    var docRef = collection.doc(model.title);
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<MovieModel>> getMovies() {
    var collection = getMoviesCollection();
    return collection.snapshots();
  }

  static Future<void> deleteMovie(String id) {
    return getMoviesCollection().doc(id).delete();
  }
  static Future<void> updateMovie(MovieModel movieModel) {
    return getMoviesCollection().doc(movieModel.id).update(movieModel.toJson());
  }
  static Future<bool> isMovieAdded(String title) async {
    var doc = await getMoviesCollection().doc(title).get();
    return doc.exists;
  }
}
