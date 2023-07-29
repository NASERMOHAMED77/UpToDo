// ignore_for_file: must_be_immutable

import 'package:firee/features/home/persentation/manager/post_screen_cubit/post_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostBody extends StatelessWidget {
  PostBody({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: Text(
          BlocProvider.of<PostCubit>(context).theards[index]['text'] == null
              ? ''
              : BlocProvider.of<PostCubit>(context).theards[index]['text'],
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
              color: Colors.black),
          maxLines: 5,
        )),
        SizedBox(
          height: 10,
        ),
        BlocProvider.of<PostCubit>(context).theards[index]['image'] == null
            ? Container()
            : ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(BlocProvider.of<PostCubit>(context)
                        .theards[index]['image']
                        .toString()),
                  ),
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/Activity.svg',
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/comment.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/repost.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/share.svg'))
          ],
        ),
        Text(
          '    20 replies  .  295 likes',
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
