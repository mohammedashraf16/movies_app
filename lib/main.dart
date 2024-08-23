import 'package:flutter/material.dart';
import 'package:movies_app/features/home/home_view.dart';

void main(){
  runApp(const MoviesApp());
}
class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName:(context)=>const HomeView(),
      },
    );
  }
}
