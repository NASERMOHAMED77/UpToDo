import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/core/utils/local_shared_pref.dart';
import 'package:firee/pages/auth/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  String? x;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    x = CacheLocal.getDataFromCache(key: 'image');
    print(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'profile',
                        style:
                            TextStyles().subTitleStyle1.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                  selectedImage != null
                      ? Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(selectedImage.toString()),
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        token.toString(),
                        style: TextStyles().titleStyle.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 155,
                        color: ThemeColors.third,
                        child: const Text(
                          '5 tasks Left',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 155,
                        color: ThemeColors.third,
                        child: const Text(
                          '4 tasks done',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'App Settings',
                      style: TextStyles().subTitleStyle1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'App Settings',
                            style: TextStyles()
                                .subTitleStyle1
                                .copyWith(color: Colors.white.withOpacity(.88)),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Account',
                          style: TextStyles().subTitleStyle1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              editProfileName(context);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Change account name',
                                  style: TextStyles().subTitleStyle1.copyWith(
                                      color: Colors.white.withOpacity(.88)),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              editProfilePassword(context);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.key_rounded,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Change account password',
                                  style: TextStyles().subTitleStyle1.copyWith(
                                      color: Colors.white.withOpacity(.88)),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 190,
                                      width: double.infinity,
                                      color: ThemeColors.third,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Change account Image',
                                                style: TextStyles()
                                                    .titleStyle
                                                    .copyWith(fontSize: 16),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 5),
                                              child: Divider(
                                                thickness: 3,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            TakeImageMethod(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            ImageFromGallary(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            ImageFromDrive()
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Change account Image',
                                  style: TextStyles().subTitleStyle1.copyWith(
                                      color: Colors.white.withOpacity(.88)),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                  UpToDoWidget(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column UpToDoWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'uptodo',
            style: TextStyles().subTitleStyle1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'About US',
                  style: TextStyles()
                      .subTitleStyle1
                      .copyWith(color: Colors.white.withOpacity(.88)),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'FAQ',
                  style: TextStyles()
                      .subTitleStyle1
                      .copyWith(color: Colors.white.withOpacity(.88)),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Help & Feedback',
                  style: TextStyles()
                      .subTitleStyle1
                      .copyWith(color: Colors.white.withOpacity(.88)),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/like.svg'),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Support US',
                  style: TextStyles()
                      .subTitleStyle1
                      .copyWith(color: Colors.white.withOpacity(.88)),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        LogOutWidget(context)
      ],
    );
  }

  InkWell LogOutWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        CacheLocal().removeDataFromCache(key: 'token').then((value) {
          token = '';
          selectedImage = '';

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        });
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/logout.svg'),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Log out',
                style: TextStyles()
                    .subTitleStyle1
                    .copyWith(color: Colors.white.withOpacity(.88)),
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  GestureDetector ImageFromDrive() {
    return GestureDetector(
      onTap: () async {
        final returnedImage = await FilePicker.platform.pickFiles();
        final imagepicked = File(returnedImage!.files.first.path.toString());
        Reference reference =
            FirebaseStorage.instance.ref().child(basename(imagepicked.path));
        await reference.putFile(File(imagepicked.path));
        String image = await reference.getDownloadURL();
        CacheLocal.insertDataIntoCache(key: 'image', value: image);

        setState(() {
          selectedImage = CacheLocal.getDataFromCache(key: 'image');
        });
      },
      child: const Text(
        'Import from Google Drive',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  GestureDetector ImageFromGallary() {
    return GestureDetector(
      onTap: () async {
        final returnedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        Reference reference =
            FirebaseStorage.instance.ref().child(basename(returnedImage!.path));
        await reference.putFile(File(returnedImage.path));
        String image = await reference.getDownloadURL();
        CacheLocal.insertDataIntoCache(key: 'image', value: image);

        setState(() {
          selectedImage = CacheLocal.getDataFromCache(key: 'image');
        });
      },
      child: const Text(
        ' Import from gallery',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  InkWell TakeImageMethod() {
    return InkWell(
      onTap: () async {
        final returnedImage =
            await ImagePicker().pickImage(source: ImageSource.camera);

        Reference reference =
            FirebaseStorage.instance.ref().child(basename(returnedImage!.path));
        await reference.putFile(File(returnedImage.path));
        String image = await reference.getDownloadURL();
        CacheLocal.insertDataIntoCache(key: 'image', value: image);

        setState(() {
          selectedImage = CacheLocal.getDataFromCache(key: 'image');
        });
      },
      child: const Text(
        'Tack picture',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<dynamic> editProfilePassword(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeColors.primary,
            title: Column(
              children: [
                Text(
                  'Change password',
                  style:
                      TextStyles().subTitleStyle1.copyWith(color: Colors.white),
                ),
                const Divider()
              ],
            ),
            content: Container(
              height: 120,
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _passcontroller,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 48,
                              width: 100,
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.44)),
                              )),
                        ),
                        SizedBox(
                          height: 48,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(token)
                                  .update({
                                'password': _passcontroller.text.trim()
                              }).then((value) {
                                Navigator.pop(
                                  context,
                                );
                              });
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> editProfileName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeColors.primary,
            title: Column(
              children: [
                Text(
                  'Change Name',
                  style:
                      TextStyles().subTitleStyle1.copyWith(color: Colors.white),
                ),
                const Divider()
              ],
            ),
            content: Container(
              height: 120,
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _namecontroller,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 48,
                              width: 100,
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.44)),
                              )),
                        ),
                        SizedBox(
                          height: 48,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(token)
                                  .update({
                                'name': _namecontroller.text.trim()
                              }).then((value) {
                                token = _namecontroller.text.trim();
                                setState(() {});
                                Navigator.pop(
                                  context,
                                );
                              });
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
