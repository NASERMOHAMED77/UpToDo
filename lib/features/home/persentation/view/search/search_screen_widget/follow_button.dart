
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constant.dart';
import '../../../manager/search_cubit/search_cubit.dart';
import '../../layout/layout_screen.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.grey),
            side: MaterialStatePropertyAll(BorderSide(color: Colors.black)),
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        onPressed: () {
          CollectionReference x = FirebaseFirestore.instance
              .collection('users')
              .doc(token)
              .collection('friends');
          DocumentReference xx = FirebaseFirestore.instance
              .collection('users')
              .doc(BlocProvider.of<SearchCubit>(context).users[index]);

          x.add(xx);
        },
        child: const Text(
          'Follow',
          style: TextStyle(color: Colors.black),
        ));
  }
}
