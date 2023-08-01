import 'package:firee/features/home/persentation/view/home_main/home_screen_widgets/reacted_pro.dart';
import 'package:firee/features/home/persentation/view/home_main/home_screen_widgets/top_bar_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/post_screen_cubit/post_screen_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return await Future.delayed(const Duration(microseconds: 600),
            () async {
          await BlocProvider.of<PostCubit>(context).getTheards();
        });
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                color: Colors.black,
                width: 35,
              ),
            ),
          ),
          SliverFillRemaining(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
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
    );
  }
}
