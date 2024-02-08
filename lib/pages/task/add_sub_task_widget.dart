
import 'package:firee/core/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddSubTask extends StatelessWidget {
  const AddSubTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/sub.svg',
          width: 30,
          color: Colors.white.withOpacity(.8),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Sub - Task',
          style: TextStyles().subTitleStyle1.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(.8)),
        ),
        const Spacer(),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.22),
            ),
            child: const Text(
              'Add Sub - Task',
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
