import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/core/utils/local_shared_pref.dart';
import 'package:firee/pages/home/main_page/task_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List notes = [];
  @override
  void initState() {
    super.initState();
    CacheLocal.sharedPrefInt();
    token = CacheLocal.getDataFromCache(key: 'token');
    FirebaseFirestore.instance
        .collection('users')
        .doc(token.toString())
        .collection('notes')
        .doc(DateTime.now().toString().split(' ')[0])
        .collection('todaynotes')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        notes.add(element);
      });
      setState(() {});
      print(notes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
              Text(
                'Index',
                style: TextStyles()
                    .titleStyle
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              selectedImage != null
                  ? Center(
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(selectedImage.toString()),
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
            ],
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(token.toString())
              .collection('notes')
              .doc(DateTime.now().toString().split(' ')[0])
              .collection('todaynotes')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text(
                'Something went wrong',
                style: TextStyle(color: Colors.amber),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(
                  "Loading",
                  style: TextStyle(color: ThemeColors.secondary),
                ),
              );
            }
            if (snapshot.data!.docs.length == 0) {
              return MainPageWidget();
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Search for your task...',
                            prefixIcon: Icon(Icons.search)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 30,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ThemeColors.third,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      UnComletedTasksWidget(
                        lenght: snapshot.data!.docs
                            .where((element) => element['completed'] == false)
                            .toList()
                            .length,
                        notes: snapshot.data!.docs
                            .where((element) => element['completed'] == false)
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ThemeColors.third,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Completed',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      CompletedtaskWidget(
                        lenght: snapshot.data!.docs
                            .where((element) => element['completed'] == true)
                            .toList()
                            .length,
                        notes: snapshot.data!.docs
                            .where((element) => element['completed'] == true)
                            .toList(),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}

class CompletedtaskWidget extends StatelessWidget {
  CompletedtaskWidget({super.key, required this.lenght, required this.notes});
  int lenght;
  List notes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .31,
        child: ListView.builder(
            itemCount: lenght,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TaskItem(
                  notes: notes,
                  index: index,
                ),
              );
            }));
  }
}

class UnComletedTasksWidget extends StatelessWidget {
  UnComletedTasksWidget({
    super.key,
    required this.lenght,
    required this.notes,
  });
  int lenght;
  List notes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .31,
        child: ListView.builder(
            itemCount: lenght,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TaskItem(
                  notes: notes,
                  index: index,
                ),
              );
            }));
  }
}

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          SvgPicture.asset('assets/icons/home.svg'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'What do you want to do today?',
            style: TextStyles()
                .titleStyle
                .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Tap + to add your tasks',
            style: TextStyles()
                .titleStyle
                .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
