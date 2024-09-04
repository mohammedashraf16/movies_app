import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/features/home/tabs/browse/browse_tab.dart';
import 'package:movies_app/features/home/tabs/home/home_tab.dart';
import 'package:movies_app/features/home/tabs/search/search_tab.dart';
import 'package:movies_app/features/home/tabs/watch_list/watch_list_tab.dart';
import 'package:movies_app/generated/assets.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: selectedIndex,  
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesHomeIcon)),
              label: "HOME",
              backgroundColor: AppColors.secondaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "SEARCH",
              backgroundColor: AppColors.secondaryColor),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesIconBrowse)),
              label: "BROWSE",
              backgroundColor: AppColors.secondaryColor),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesIconWatchList)),
              label: "WATCHLIST",
              backgroundColor: AppColors.secondaryColor),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    const HomeTab(),
     const SearchTab(),
    const BrowseTab(),
    const WatchListTab(),
  ];
}
