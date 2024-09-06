import 'package:flutter/material.dart';
import 'package:movies_app/features/home/tabs/watch_list/widgets/watch_list_body.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WatchListBody(),
      ),
    );
  }
}
