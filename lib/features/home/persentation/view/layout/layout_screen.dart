// ignore_for_file: deprecated_member_use

import 'package:firee/features/home/persentation/view/activity_screen/activity_screen.dart';
import 'package:firee/features/home/persentation/view/home_main/home_screen.dart';
import 'package:firee/features/home/persentation/view/post_screen/post_screen.dart';
import 'package:firee/features/home/persentation/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../account_screen/account_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

int index = 0;

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomeScreenBody(),
      SearchScreenBody(),
      PostScreen(),
      ActivityScreenBody(),
      ProfileScreenBody()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((value) {
          index = value;
          setState(() {});
        }),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Home.svg',
                color: index == 0 ? Colors.black : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Search.svg',
                color: index == 1 ? Colors.black : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Write.png',
                color: index == 2 ? Colors.black : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Activity.svg',
                color: index == 3 ? Colors.red : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                color: index == 4 ? Colors.black : Colors.grey,
              ),
              label: '')
        ],
      ),
      body: screens[index],
    );
  }
}
