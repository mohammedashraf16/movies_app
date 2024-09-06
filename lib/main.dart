import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/firebase_options.dart';
import 'package:movies_app/features/details/presentation/views/details_view.dart';
import 'package:movies_app/features/home/home_view.dart';
import 'package:movies_app/features/home/tabs/browse/widgets/discover_movie_view.dart';
import 'package:movies_app/features/provider/app_config_provider.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:movies_app/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => WatchListProvider(),
    child: const MoviesApp(),
  ));
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => const HomeView(),
        DetailsView.routeName: (context) => const DetailsView(),
        DiscoverMovieView.routeName: (context) =>  const DiscoverMovieView(),
      },
    );
  }
}
