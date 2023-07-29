import 'package:firee/features/home/persentation/view/layout/layout_screen.dart';
import 'package:firee/features/login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';
import 'package:firee/features/login_screen/persentation/manger/login_screen_cubit/login_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/sign.png',
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).loginByGoogle();
                    if (state is LoginSuccessState) {
                      BlocProvider.of<LoginCubit>(context).getprofilinfo();

                      Get.to(const LayoutScreen());
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.black38, width: 1.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Login With Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SvgPicture.asset('assets/icons/google.svg')
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Switch accounts",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
