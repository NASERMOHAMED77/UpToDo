// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';
import '../../../manager/post_screen_cubit/post_screen_cubit.dart';

class SendTheardButton extends StatelessWidget {
  const SendTheardButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: IconButton(
          onPressed: () async {
            if (BlocProvider.of<PostCubit>(context).imageFile == null &&
                BlocProvider.of<PostCubit>(context).text == null) {
            } else {
              if (BlocProvider.of<PostCubit>(context).imageFile != null) {
                String url =
                    await BlocProvider.of<PostCubit>(context).uploadImage();
                await BlocProvider.of<PostCubit>(context).uploadTheard(
                    url: url,
                    senderName: BlocProvider.of<LoginCubit>(context).xa[0]
                        ['name'],
                    senderimage: BlocProvider.of<LoginCubit>(context).xa[0]
                        ['image']);

                BlocProvider.of<PostCubit>(context).imageFile = null;
                BlocProvider.of<PostCubit>(context).text = null;
              } else {
                await BlocProvider.of<PostCubit>(context).uploadTheard(
                    senderName: BlocProvider.of<LoginCubit>(context).xa[0]
                        ['name'],
                    senderimage: BlocProvider.of<LoginCubit>(context).xa[0]
                        ['image']);
                //  BlocProvider.of<PostCubit>(context).getTheards();
              }
            }
          },
          icon: Icon(
            Icons.send,
            color: Colors.grey,
          )),
    );
  }
}
