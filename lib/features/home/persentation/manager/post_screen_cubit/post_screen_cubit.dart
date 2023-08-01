// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firee/features/home/persentation/manager/post_screen_cubit/post_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState());
  File? imageFile;
  String? text;
  pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = File(pickedImage!.path);
  }

  Future<String> uploadImage() async {
    Reference imageRef =
        FirebaseStorage.instance.ref(basename(imageFile!.path));
    await imageRef.putFile(imageFile!);
    return await imageRef.getDownloadURL();
  }

  uploadTheard({String? url, String? senderimage, String? senderName}) {
    CollectionReference theards =
        FirebaseFirestore.instance.collection('theards');
    theards.add({
      'text': text,
      'image': url,
      'senderimage': senderimage,
      'sendername': senderName
    });
  }

  List theards = [];
  getTheards() async {
    FirebaseFirestore.instance
        .collection('theards')
        .snapshots()
        .listen((event) {
      theards = [];
      event.docs.forEach((element) {
        theards.add(element);
      });
    });
  }
}
