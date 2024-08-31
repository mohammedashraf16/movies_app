import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/details/presentation/views/details_view.dart';
import 'package:movies_app/features/home/home_view.dart';
import 'package:movies_app/features/home/tabs/browse/widgets/discover_movie_view.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:movies_app/features/theme/my_theme_data.dart';
import 'package:movies_app/firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MoviesApp());
}
class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName:(context)=>const SplashView(),
        HomeView.routeName:(context)=>const HomeView(),
        DetailsView.routeName:(context)=> DetailsView(),
        DiscoverMovieView.routeName:(context)=> const DiscoverMovieView(),
      },
    );
  }
}
