import 'package:firee/features/home/persentation/view/home_main/home_screen_widgets/top_bar_post.dart';
import 'package:firee/features/login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/post_screen_cubit/post_screen_cubit.dart';
import '../home_main/home_screen_widgets/reacted_pro.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.sports_basketball_outlined),
                Row(
                  children: [
                    Icon(Icons.camera_enhance_outlined),
                    Icon(Icons.menu),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BlocProvider.of<LoginCubit>(context)
                                .xa[0]['name']
                                .toString()
                                .split(' ')[0] +
                            ' ' +
                            BlocProvider.of<LoginCubit>(context)
                                .xa[0]['name']
                                .toString()
                                .split(' ')[1],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        '_' +
                            BlocProvider.of<LoginCubit>(context)
                                .xa[0]['email']
                                .toString()
                                .split('@')[0],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        BlocProvider.of<LoginCubit>(context)
                            .xa[0]['image']
                            .toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.grey),
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.black)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {},
                      child: const Text(
                        '    Edit Profile    ',
                        style: TextStyle(color: Colors.black),
                      )),
                  FilledButton(
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.grey),
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.black)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {},
                      child: const Text(
                        'Share Profile',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Theards',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: BlocProvider.of<PostCubit>(context).theards.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Theards(
                          index: index,
                        ),
                        Positioned(
                            left: 36,
                            top: 60,
                            bottom: 20,
                            child: Container(
                              height: 1000,
                              width: 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.grey.shade300,
                              ),
                            )),
                        const ReactedProfiles()
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
