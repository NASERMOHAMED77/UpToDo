import 'dart:io';

import 'package:firee/features/home/data/repos/post_screen_repo/post_repo.dart';
import 'package:image_picker/image_picker.dart';

class PostTheardRepoImp extends PostTheardRepo {
  @override
  Future<File> pickImage() async {
    File imageFile;
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = File(pickedImage!.path);
    return imageFile;
  }
}
