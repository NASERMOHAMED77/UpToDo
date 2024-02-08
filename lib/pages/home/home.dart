import 'dart:math';

import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/auth/profile_page/profile_page.dart';
import 'package:firee/pages/home/calender_page/calender_page.dart';
import 'package:firee/pages/home/fouce_page/fouces_page.dart';
import 'package:firee/pages/home/main_page/main_page.dart';
import 'package:firee/pages/home/task_bottomSheet/task_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentScreen = const MainPage();
  final PageStorageBucket bucket = PageStorageBucket();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: PageStorageBucket(), child: currentScreen),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.secondary,
        onPressed: () {
          var id = Random(1500);
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: TaskBottomSheet(
                    id: id.nextInt(1000),
                  ),
                );
              });
        },
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff363636),
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,
        child: SizedBox(
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                setState(() {
                  currentScreen = const MainPage();
                  currentIndex = 0;
                });
              },
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.home,
                    color: currentIndex == 0 ? Colors.white : Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 0 ? Colors.white : Colors.grey),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                  currentScreen = const CalenderPage();
                  print(currentIndex);
                });
              },
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.calendar,
                    color: currentIndex == 1 ? Colors.white : Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Calender',
                    style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 1 ? Colors.white : Colors.grey),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                currentIndex = 2;
                setState(() {
                  currentScreen = const FouceModePage();
                });
              },
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.lightbulb_fill,
                    color: currentIndex == 2 ? Colors.white : Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FocusMode',
                    style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 2 ? Colors.white : Colors.grey),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                currentIndex = 3;
                setState(() {
                  currentScreen = const ProfilePage();
                });
              },
              child: Column(
                children: [
                  Icon(CupertinoIcons.profile_circled,
                      color: currentIndex == 3 ? Colors.white : Colors.grey),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 3 ? Colors.white : Colors.grey),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
