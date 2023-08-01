// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/constant.dart';
import 'package:firee/features/home/data/repos/home_screen_repo/Home_repo.dart';

class HomeRepoImpe extends HomeRepo {
  List theards = [];

  @override
  getTheards() {
    FirebaseFirestore.instance
        .collection('theards')
        .snapshots()
        .listen((event) {
      theards = [];
      event.docs.forEach((element) {
        theards.add(element);
      });
    });
    return theards;
  }

  List theard = [];

  @override
  getUserTheards() async {
    FirebaseFirestore.instance
        .collection('theards')
        .doc(token)
        .snapshots()
        .listen((event) {
      DocumentSnapshot x = event;
      theard.add(x);
    });

    return theard;
  }
}
