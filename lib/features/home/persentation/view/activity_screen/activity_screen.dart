import 'package:firee/features/home/persentation/manager/post_screen_cubit/post_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ActivityScreenBody extends StatelessWidget {
  const ActivityScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'Activity',
          ),
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<PostCubit>(context).getTheards();
            },
            child: const Text('pressed'))
      ],
    );
  }
}
