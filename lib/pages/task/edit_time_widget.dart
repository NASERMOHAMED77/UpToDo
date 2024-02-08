
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditTaskTimeWidget extends StatelessWidget {
  const EditTaskTimeWidget({
    super.key,
    required this.widget,
  });

  final TaskPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/timer.svg',
          width: 30,
          color: Colors.white.withOpacity(.8),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Task Time :',
          style: TextStyles().subTitleStyle1.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(.8)),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            ).then((selectedDate) {
              // After selecting the date, display the time picker.
              if (selectedDate != null) {
                showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input)
                    .then((selectedTime) {
                  // Handle the selected date and time here.
                  if (selectedTime != null) {
                    DateTime selectedDateTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                    print(
                        selectedDateTime); // You can use the selectedDateTime as needed.

                    FirebaseFirestore.instance
                        .collection('notes')
                        .doc(widget.noteId.toString())
                        .update({
                      'date': selectedDate.toString(),
                      'time': selectedTime.toString(),
                    });
                  }
                });
              }
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.22),
            ),
            child: Text(
              widget.note[0]['date'].toString().split(' ')[0],
              style: const TextStyle(color: Colors.white),
              maxLines: 1,
            ),
          ),
        )
      ],
    );
  }
}
