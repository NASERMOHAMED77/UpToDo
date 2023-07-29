import 'package:firee/features/home/persentation/view/post_screen/post_screnes_widget/post_theards_body.dart';
import 'package:firee/features/home/persentation/view/post_screen/post_screnes_widget/post_theards_bottomBar.dart';
import 'package:firee/features/home/persentation/view/post_screen/post_screnes_widget/post_theards_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';

class PostScreenBody extends StatelessWidget {
  const PostScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
          title: const Text(
            "New theard",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      BlocProvider.of<LoginCubit>(context).xa[0]['image']),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 0, top: 20),
                child: Text(
                  BlocProvider.of<LoginCubit>(context).xa[0]['name'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              subtitle: PostTheardBody(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [PostTheardBottomBar(), SendTheardButton()],
              ),
            ),
          ],
        ));
  }
}
/*
const SizedBox(
          height: 300,
          child:  Column(
            children: [
              PostTheardTopBar(),
              PostTheardBody(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [PostTheardBottomBar(), SendTheardButton()],
              ),
            ],
          ),
        ) */