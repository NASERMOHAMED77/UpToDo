// ignore_for_file: unnecessary_null_comparison

import 'package:firee/features/home/persentation/view/search/search_screen_widget/search_formField.dart';
import 'package:firee/features/home/persentation/view/search/search_screen_widget/user_item.dart';
import 'package:flutter/material.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({
    super.key,
  });

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  List users = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SearchTextField(),
            UserItem(),
          ],
        ),
      ),
    ));
  }
}
