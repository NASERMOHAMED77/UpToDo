import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/home/main_page/task_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime selectedday = DateTime.now();

  void selectedDay(DateTime day, DateTime foucedDay) {
    setState(() {
      selectedday = day;
    });
  }

  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.primary,
          centerTitle: true,
          title: const Text(
            "Calender",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              child: TableCalendar(
                  calendarFormat: CalendarFormat.week,
                  rowHeight: 35,
                  headerStyle: HeaderStyle(
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      titleTextStyle: const TextStyle(color: Colors.white),
                      decoration: BoxDecoration(color: ThemeColors.third),
                      formatButtonVisible: false,
                      titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  firstDay: DateTime.utc(2010, 10, 16),
                  daysOfWeekHeight: 20,
                  daysOfWeekStyle: DaysOfWeekStyle(
                      decoration: BoxDecoration(
                        color: ThemeColors.third,
                      ),
                      weekdayStyle: const TextStyle(color: Colors.white),
                      weekendStyle: const TextStyle(color: Colors.red)),
                  calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                          color: ThemeColors.secondary,
                          shape: BoxShape.rectangle),
                      todayDecoration: BoxDecoration(
                          color: ThemeColors.secondary,
                          shape: BoxShape.rectangle),
                      markerDecoration: BoxDecoration(
                          color: ThemeColors.secondary,
                          shape: BoxShape.rectangle),
                      weekendDecoration: BoxDecoration(
                          color: ThemeColors.primary,
                          borderRadius: BorderRadius.circular(2)),
                      defaultDecoration: BoxDecoration(
                          color: ThemeColors.primary,
                          borderRadius: BorderRadius.circular(2)),
                      outsideDaysVisible: true,
                      withinRangeDecoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(2)),
                      // withinRangeDecoration: BoxDecoration(
                      //     color: Colors.white, shape: BoxShape.rectangle),
                      rowDecoration: BoxDecoration(color: ThemeColors.third),
                      outsideTextStyle: const TextStyle(color: Colors.white),
                      weekendTextStyle: const TextStyle(color: Colors.white),
                      todayTextStyle: const TextStyle(color: Colors.white),
                      defaultTextStyle: const TextStyle(color: Colors.white)),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: selectedday,
                  selectedDayPredicate: (day) {
                    return isSameDay(day, selectedday);
                  },
                  onDaySelected: (DateTime day, DateTime foucedDay) {
                    setState(() {
                      selectedday = day;
                    });
                  }),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(token.toString())
                  .collection('notes')
                  .doc(selectedday.toString().split(' ')[0])
                  .collection('todaynotes')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.amber),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    "Loading",
                    style: TextStyle(color: ThemeColors.secondary),
                  );
                }
                if (snapshot.data!.docs.length == 0) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        SvgPicture.asset('assets/icons/home.svg'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'What do you want to do today?',
                          style: TextStyles().titleStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tap + to add your tasks',
                          style: TextStyles().titleStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }

                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TaskItem(
                              notes: snapshot.data!.docs,
                              index: index,
                            ),
                          );
                        }));
              },
            ),
          ],
        ));
  }
}

class CalendarAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CalendarAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(148.0);

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.third,
      toolbarHeight: 148.0,
      title: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  "Calender",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              children: List.generate(
                lastDayOfMonth.day,
                (index) {
                  final currentDate =
                      lastDayOfMonth.add(Duration(days: index + 1));
                  final dayName =
                      DateFormat('EEEE', 'en_US').format(currentDate);
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 12.0 : 0.0, right: 12.0),
                    child: GestureDetector(
                      onTap: () => setState(
                        () {
                          selectedIndex = index;
                        },
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? ThemeColors.secondary
                              : ThemeColors.primary.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42.0,
                              width: 42.0,
                              alignment: Alignment.center,
                              child: Text(
                                dayName.substring(0, 3),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: dayName.substring(0, 3) == 'Sun' ||
                                          dayName.substring(0, 3) == 'Sat'
                                      ? Colors.red
                                      : Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              "${index + 1}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
