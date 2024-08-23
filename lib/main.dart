import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/features/home/home_view.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:movies_app/features/theme/my_theme_data.dart';

void main(){
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
      },
    );
  }
}
