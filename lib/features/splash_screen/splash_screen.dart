import 'package:firee/constant.dart';
import 'package:firee/features/home/persentation/manager/home_cubit/home_cubit.dart';
import 'package:firee/features/home/persentation/manager/post_screen_cubit/post_screen_cubit.dart';
import 'package:firee/features/home/persentation/manager/search_cubit/search_cubit.dart';
import 'package:firee/features/home/persentation/view/layout/layout_screen.dart';
import 'package:firee/features/login_screen/persentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getTheards();
    BlocProvider.of<PostCubit>(context).getTheards();
    BlocProvider.of<LoginCubit>(context).getprofilinfo();
    BlocProvider.of<SearchCubit>(context).getUser();

    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => token == "" ? const LoginScreen() : const LayoutScreen(),
          duration: kTranstionDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * .3,
              ),
            ),
          ),
          const Column(
            children: [
              Center(
                  child: CircularProgressIndicator(
                color: Colors.deepPurple,
              )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
