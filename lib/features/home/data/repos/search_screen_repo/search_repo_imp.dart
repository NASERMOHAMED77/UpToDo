import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/features/home/data/repos/search_screen_repo/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  @override
  Future<List> getUser() async{ 
          CollectionReference theardsref =
                      FirebaseFirestore.instance.collection('users');
                  QuerySnapshot x = await theardsref.get();
                  List theardsdata = x.docs;
            return theardsdata;
                }
  }
  