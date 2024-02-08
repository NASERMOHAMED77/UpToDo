import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.notes,
    required this.index,
  });

  final List notes;
  final int index;
  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: ThemeColors.third, borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(token.toString())
                          .collection('notes')
                          .doc(DateTime.now().toString().split(' ')[0])
                          .collection('todaynotes')
                          .doc(
                            widget.notes[widget.index]['id'].toString(),
                          )
                          .update({'completed': true}).then((value) {
                        print('done');
                      });
                    },
                    child: widget.notes[widget.index]['completed'] == true
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            'assets/icons/Ellipse 15.svg',
                            width: 30,
                          )),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    List note = [];
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(token.toString())
                        .collection('notes')
                        .doc(DateTime.now().toString().split(' ')[0])
                        .collection('todaynotes')
                        .doc(
                          widget.notes[widget.index]['id'].toString(),
                        )
                        .get()
                        .then((value) {
                      note.add(value);
                      setState(() {});
                    }).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskPage(
                                    noteId: widget.notes[widget.index]['id'],
                                    note: note,
                                  )));
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.notes[widget.index]['title'],
                        style: TextStyles().titleStyle.copyWith(fontSize: 16),
                      ),
                      Text(widget.notes[widget.index]['description'],
                          style: TextStyles()
                              .subTitleStyle1
                              .copyWith(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(int.parse(
                            widget.notes[widget.index]['category_color'])),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.network(
                          widget.notes[widget.index]['category_icon'],
                          color: Colors.white,
                          width: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(widget.notes[widget.index]['category'],
                            style:
                                TextStyles().titleStyle.copyWith(fontSize: 14)),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 29,
                    width: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: ThemeColors.secondary),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset('assets/icons/flag.svg'),
                        Text(widget.notes[widget.index]['priorty'].toString(),
                            style:
                                TextStyles().titleStyle.copyWith(fontSize: 14)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
