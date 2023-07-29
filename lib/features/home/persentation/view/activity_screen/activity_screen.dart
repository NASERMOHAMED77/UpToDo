
import 'package:flutter/material.dart';

class ActivityScreenBody extends StatelessWidget {
  const ActivityScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Activity',
          ),
        ),
      ],
    );
  }
}