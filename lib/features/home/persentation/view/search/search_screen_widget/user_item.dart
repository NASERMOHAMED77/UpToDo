// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:firee/features/home/persentation/manager/search_cubit/search_cubit.dart';
import 'package:firee/features/home/persentation/manager/search_cubit/search_state.dart';
import 'package:firee/features/home/persentation/view/search/search_screen_widget/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: BlocProvider.of<SearchCubit>(context).users.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .12,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    BlocProvider.of<SearchCubit>(context)
                                        .users[index]['image']
                                        .toString(),
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '_${BlocProvider.of<SearchCubit>(context).users[index]['email'].toString().split('@')[0]}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      BlocProvider.of<SearchCubit>(context)
                                          .users[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      '12 Followers',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const FollowButton(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 68, bottom: 8),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    ],
                  );
                }),
          );
        } else if (state is GetUserFailure) {
          return Text(state.massages);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
