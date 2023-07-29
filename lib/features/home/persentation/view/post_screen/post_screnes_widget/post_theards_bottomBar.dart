import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../login_screen/persentation/manger/login_screen_cubit/login_screen_cubit.dart';

class PostTheardBottomBar extends StatelessWidget {
  const PostTheardBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey,
                  child: SvgPicture.asset(
                    'assets/icons/google.svg',
                    fit: BoxFit.fill,
                  )),
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                    BlocProvider.of<LoginCubit>(context).xa[0]['image']),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Add to theard',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey.withOpacity(.3)),
          ),
        ],
      ),
    );
  }
}
