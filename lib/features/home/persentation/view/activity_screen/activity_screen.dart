import 'package:flutter/material.dart';

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
            'No one Follows you',
          ),
        ),
      ],
    );
  }
}
