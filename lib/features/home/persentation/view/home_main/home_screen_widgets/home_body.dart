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
        return await Future.delayed(Duration(microseconds: 600), () async {
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
                          left: 42,
                          top: 60,
                          bottom: 20,
                          child: Container(
                            height: 1000,
                            width: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.grey.shade300,
                            ),
                          )),
                      Positioned(
                          left: 40,
                          bottom: 8,
                          child: Container(
                            height: 35,
                            width: 35,
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 9,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: CircleAvatar(
                                    radius: 7,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 8,
                                  child: CircleAvatar(
                                    radius: 6,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
//  ListTile(
//               leading: CircleAvatar(
//                 backgroundImage:
//                     AssetImage('images/${threadlist.profileImage}'),
//               ),
//               title: Row(
//                 children: [
//                   Text(
//                     threadlist.name ?? 'name',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Spacer(),
//                   Text(
//                     threadlist.posted!,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey.shade500,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Icon(Icons.more_horiz)
//                 ],
//               ),
//               subtitle: Text(
//                 threadlist.description!,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             if (threadlist.image != '')
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 20,
//                   left: 70,
//                 ),
//                 child: Container(
//                   height: 300,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.amber,
//                       image: DecorationImage(
//                         image: AssetImage('images/${threadlist.image}'),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//               ),