// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:firee/features/home/persentation/view/post_screen/post_screnes_widget/post_screen_body.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    super.key,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

String? text;

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return PostScreenBody();
  }
}
