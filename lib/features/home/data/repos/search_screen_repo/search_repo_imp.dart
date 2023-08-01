// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/features/home/data/repos/search_screen_repo/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  List users = [];

  @override
  Future<List> getUsers() async {
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      event.docs.forEach((element) {
        users.add(element);
      });
    });
    return users;
  }
}
