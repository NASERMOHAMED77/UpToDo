// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostTheardTopBar extends StatelessWidget {
  const PostTheardTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 20,
            backgroundColor: const Color.fromARGB(255, 251, 242, 242),
            child: SvgPicture.asset(
              'assets/icons/google.svg',
              fit: BoxFit.fill,
            )),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 5),
          child: Text(
            'Google ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
