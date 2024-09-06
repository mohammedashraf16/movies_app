import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/home/tabs/search/widgets/search_result_deleget.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: SearchResultDelegate());
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "Search",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.grayColor,
                          ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
