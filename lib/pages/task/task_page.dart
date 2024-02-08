// ignore_for_file: must_be_immutable


import 'package:firee/pages/task/add_sub_task_widget.dart';
import 'package:firee/pages/task/delete_task_widget.dart';
import 'package:firee/pages/task/edit_category_widget.dart';
import 'package:firee/pages/task/edit_priority_widget.dart';
import 'package:firee/pages/task/edit_time_widget.dart';
import 'package:firee/pages/task/edit_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key, required this.noteId, required this.note});
  int noteId;
  List note;
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.note == []
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Close.svg',
                        width: 35,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Repeat.svg',
                        width: 35,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  EditTaskTitleWidget(
                      note: widget.note,
                      widget: widget,
                      titleController: titleController,
                      desController: desController),
                  const SizedBox(height: 30),
                  EditTaskTimeWidget(widget: widget),
                  const SizedBox(height: 30),
                  EditTaskCategory(widget: widget),
                  const SizedBox(height: 30),
                  const EditTaskPriorityWidget(),
                  const SizedBox(height: 30),
                  const AddSubTask(),
                  const SizedBox(height: 30),
                  DeleteTaskWidget(widget: widget),
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Save')))
                ],
              ),
            )),
    );
  }
}
