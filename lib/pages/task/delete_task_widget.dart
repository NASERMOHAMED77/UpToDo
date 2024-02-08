
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteTaskWidget extends StatelessWidget {
  const DeleteTaskWidget({
    super.key,
    required this.widget,
  });

  final TaskPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/trash.svg',
          width: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            FirebaseFirestore.instance
                .collection('notes')
                .doc(widget.noteId.toString())
                .delete();
          },
          child: Text(
            'Delete Task',
            style: TextStyles().subTitleStyle1.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.red.withOpacity(.8)),
          ),
        ),
      ],
    );
  }
}
