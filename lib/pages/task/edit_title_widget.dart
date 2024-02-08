
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditTaskTitleWidget extends StatelessWidget {
  const EditTaskTitleWidget({
    super.key,
    required this.note,
    required this.widget,
    required this.titleController,
    required this.desController,
  });

  final List note;
  final TaskPage widget;
  final TextEditingController titleController;
  final TextEditingController desController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/Ellipse 15.svg',
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note[0]['title'] ?? '',
                  style: TextStyles()
                      .titleStyle
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Column(
                          children: [
                            Text(
                              'Edit Task title',
                              style: TextStyles()
                                  .subTitleStyle1
                                  .copyWith(color: Colors.white),
                            ),
                            const Divider()
                          ],
                        ),
                        backgroundColor: ThemeColors.third,
                        content: SizedBox(
                          height: 200,
                          width: 330,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: true,
                                  controller: titleController,
                                  decoration: InputDecoration(
                                      hintText: note[0]['title'],
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                                TextFormField(
                                  controller: desController,
                                  decoration: InputDecoration(
                                      hintText: note[0]['title'],
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        FirebaseFirestore.instance
                                            .collection('notes')
                                            .doc(widget.noteId.toString())
                                            .update({
                                          'title': titleController.text,
                                          'description': desController.text,
                                        });
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 48,
                                          width: 100,
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(.44)),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 48,
                                      width: 150,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                width: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          note[0]['description'],
          style: TextStyles()
              .subTitleStyle1
              .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
