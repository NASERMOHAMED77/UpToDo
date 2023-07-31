// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firee/features/home/persentation/view/home_main/home_screen_widgets/body_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';

class Theards extends StatelessWidget {
  const Theards({super.key, this.index});
  final  index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage:
              NetworkImage(BlocProvider.of<LoginCubit>(context).xa[0]['image']),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 0, top: 20),
        child: Text(
          BlocProvider.of<LoginCubit>(context).xa[0]['name'].toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      subtitle: PostBody(
        index: index,
      ),
    );
  }
}
