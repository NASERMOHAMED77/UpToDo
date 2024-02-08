// ignore_for_file: must_be_immutable, prefer_final_fields, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/models/note_model.dart';
import 'package:firee/pages/category/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key, required this.id});
  var id;

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _desController = TextEditingController();

  late int? priority;
  String? category;
  String? category_icon;
  int? category_color;
  String? date;
  List categories = [];
  String? selectedTime;
  DateTime selectedday = DateTime.now();
  void selectedDay(DateTime day, DateTime foucedDay) {
    setState(() {
      selectedday = day;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('category').get().then((value) {
      for (var element in value.docs) {
        categories.add(element);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: ThemeColors.third,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Text(
              'Add Task',
              style: TextStyles().titleStyle.copyWith(fontSize: 20),
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              controller: _titleController,
              decoration: const InputDecoration(
                  hintText: 'Title',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent))),
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _desController,
              decoration: const InputDecoration(
                  hintText: 'Description',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent))),
            ),
            Row(
              children: [
                pickTimeAndDate(context),
                pixkCategory(context),
                pickPriority(context),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      NoteModel noteModel = NoteModel(
                          category: category.toString(),
                          category_color: category_color.toString(),
                          category_icon: category_icon.toString(),
                          time: selectedday.toString().split(' ')[1],
                          title: _titleController.text,
                          date: selectedday.toString().split(' ')[0],
                          description: _desController.text.trim(),
                          completed: false,
                          id: widget.id,
                          priorty: priority!.toInt());
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(token.toString())
                          .collection('notes')
                          .doc(selectedday.toString().split(' ')[0])
                          .collection('todaynotes')
                          .doc(widget.id.toString())
                          .set(
                            noteModel.toMap(),
                          )
                          .then((value) {
                        print('done');
                      });
                      print(selectedday.toString().split(' ')[0]);
                    },
                    icon: const Icon(
                      CupertinoIcons.add_circled,
                      color: Colors.blue,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  IconButton pickPriority(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    Text(
                      'Task Priority',
                      style: TextStyles()
                          .subTitleStyle1
                          .copyWith(color: Colors.white),
                    ),
                    const Divider()
                  ],
                ),
                backgroundColor: ThemeColors.third,
                content: SizedBox(
                  height: 300,
                  width: 330,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            itemCount: 10,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  overlayColor: MaterialStatePropertyAll(
                                      ThemeColors.secondary),
                                  onTap: () {
                                    priority = (index + 1);
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    color: const Color(0xff272727),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/flag.svg'),
                                        Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 100,
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.44)),
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
              );
            });
      },
      icon: SvgPicture.asset('assets/icons/flag.svg'),
    );
  }

  IconButton pixkCategory(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Column(
                    children: [
                      Text(
                        'Choose Category',
                        style: TextStyles()
                            .subTitleStyle1
                            .copyWith(color: Colors.white),
                      ),
                      const Divider()
                    ],
                  ),
                  backgroundColor: ThemeColors.third,
                  content: SizedBox(
                    height: 300,
                    width: 330,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('category')
                                .get()
                                .asStream(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return const Text(
                                  'Something went wrong',
                                  style: TextStyle(color: Colors.amber),
                                );
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Text(
                                    "Loading",
                                    style:
                                        TextStyle(color: ThemeColors.secondary),
                                  ),
                                );
                              }
                              return Expanded(
                                child: GridView.builder(
                                    itemCount: categories.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          overlayColor:
                                              MaterialStatePropertyAll(
                                                  ThemeColors.secondary),
                                          onTap: () {
                                            category_color = categories[index]
                                                ['category_color'];
                                            category_icon = categories[index]
                                                ['category_icon'];
                                            category =
                                                categories[index]['category'];
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 65,
                                                decoration: BoxDecoration(
                                                    color: Color(snapshot
                                                            .data!.docs[index]
                                                        ['category_color']),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SvgPicture.network(
                                                        snapshot.data!
                                                                .docs[index]
                                                            ['category_icon'],
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.docs[index]
                                                    ['category'],
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryPage()));
                                },
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xff272727),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                'Create New',
                                style: TextStyles().subTitleStyle1.copyWith(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        // ColorsListView(),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: const Icon(
          CupertinoIcons.tag,
          color: Colors.white,
        ));
  }

  IconButton pickTimeAndDate(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    backgroundColor: ThemeColors.third,
                    content: StatefulBuilder(builder: (context, setState) {
                      return SizedBox(
                        height: 325,
                        width: 450,
                        child: Column(
                          children: [
                            TableCalendar(
                                rowHeight: 35,
                                headerStyle: const HeaderStyle(
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                    ),
                                    formatButtonDecoration:
                                        BoxDecoration(color: Colors.white),
                                    titleTextStyle:
                                        TextStyle(color: Colors.white),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    formatButtonVisible: false,
                                    titleCentered: true),
                                availableGestures: AvailableGestures.all,
                                firstDay: DateTime.utc(2010, 10, 16),
                                daysOfWeekHeight: 20,
                                daysOfWeekStyle: const DaysOfWeekStyle(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    weekdayStyle:
                                        TextStyle(color: Colors.white),
                                    weekendStyle: TextStyle(color: Colors.red)),
                                calendarStyle: CalendarStyle(
                                    withinRangeDecoration: BoxDecoration(
                                        color: Colors.white12,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(2)),
                                    // withinRangeDecoration: BoxDecoration(
                                    //     color: Colors.white, shape: BoxShape.rectangle),
                                    rowDecoration: const BoxDecoration(
                                        color: Colors.transparent),
                                    outsideTextStyle:
                                        const TextStyle(color: Colors.white),
                                    weekendTextStyle:
                                        const TextStyle(color: Colors.white),
                                    todayTextStyle:
                                        const TextStyle(color: Colors.white),
                                    defaultTextStyle:
                                        const TextStyle(color: Colors.white)),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: selectedday,
                                selectedDayPredicate: (day) {
                                  return isSameDay(day, selectedday);
                                },
                                onDaySelected:
                                    (DateTime day, DateTime foucedDay) {
                                  setState(() {
                                    selectedday = day;
                                  });
                                }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(
                                        context,
                                      );
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
                                      onPressed: () {
                                        Navigator.pop(
                                          context,
                                        );
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                                initialEntryMode:
                                                    TimePickerEntryMode.input)
                                            .then((time) {
                                          selectedTime = time.toString();
                                          setState(() {});
                                        });
                                      },
                                      child: const Text(
                                        "Choose Time",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }));
              }).then((value) {});
          // showDatePicker(
          //   context: context,
          //   initialDate: DateTime.now(),
          //   firstDate: DateTime.now(),
          //   lastDate: DateTime(2101),
          // ).then((selectedDate) {
          //   // After selecting the date, display the time picker.
          //   if (selectedDate != null) {
          //     showTimePicker(
          //             context: context,
          //             initialTime: TimeOfDay.now(),
          //             initialEntryMode: TimePickerEntryMode.input)
          //         .then((selectedTime) {
          //       // Handle the selected date and time here.
          //       if (selectedTime != null) {
          //         DateTime selectedDateTime = DateTime(
          //           selectedDate.year,
          //           selectedDate.month,
          //           selectedDate.day,
          //           selectedTime.hour,
          //           selectedTime.minute,
          //         );
          //         setState(() {
          //           date = selectedDate.toString();
          //           time = selectedTime.toString();
          //         });
          //         // FirebaseFirestore.instance
          //         //     .collection('notes')
          //         //     .doc(widget.id.toString())
          //         //     .update({
          //         //   'date': selectedDate.toString(),
          //         //   'time': selectedTime.toString(),
          //         // });
          //       }
          //     });
          //   }
          // });
        },
        icon: const Icon(
          CupertinoIcons.clock,
          color: Colors.white,
        ));
  }
}

class CalenderTableWidget extends StatefulWidget {
  CalenderTableWidget({super.key, required this.selectedday});
  DateTime selectedday;

  @override
  State<CalenderTableWidget> createState() => _CalenderTableWidgetState();
}

class _CalenderTableWidgetState extends State<CalenderTableWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: ThemeColors.third,
        content: SizedBox(
          height: 400,
          width: 450,
          child: TableCalendar(
              rowHeight: 35,
              headerStyle: const HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  formatButtonDecoration: BoxDecoration(color: Colors.white),
                  titleTextStyle: TextStyle(color: Colors.white),
                  decoration: BoxDecoration(color: Colors.transparent),
                  formatButtonVisible: false,
                  titleCentered: true),
              availableGestures: AvailableGestures.all,
              firstDay: DateTime.utc(2010, 10, 16),
              daysOfWeekHeight: 20,
              daysOfWeekStyle: const DaysOfWeekStyle(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.red)),
              calendarStyle: CalendarStyle(
                  withinRangeDecoration: BoxDecoration(
                      color: Colors.white12,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2)),
                  // withinRangeDecoration: BoxDecoration(
                  //     color: Colors.white, shape: BoxShape.rectangle),
                  rowDecoration: const BoxDecoration(color: Colors.transparent),
                  outsideTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  todayTextStyle: const TextStyle(color: Colors.white),
                  defaultTextStyle: const TextStyle(color: Colors.white)),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: widget.selectedday,
              selectedDayPredicate: (day) {
                return isSameDay(day, widget.selectedday);
              },
              onDaySelected: (DateTime day, DateTime foucedDay) {
                setState(() {
                  widget.selectedday = day;
                });
              }),
        ));
  }
}
