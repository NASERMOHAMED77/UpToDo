import 'package:firee/features/home/persentation/view/home_main/home_screen_widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  // ignore: must_call_super
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoginCubit>(context).getprofilinfo();
  }

  @override
  Widget build(BuildContext context) {
  
    return const SafeArea(child: HomeBody());
  }
}
