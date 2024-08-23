import 'package:flutter/material.dart';
import 'package:movies_app/features/home/home_view.dart';
import 'package:movies_app/generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigationFun();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          Assets.imagesLogo,
        )),
      ],
    );
  }
  void navigationFun() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(
          context,
          HomeView.routeName,
        );
      },
    );
  }
}
