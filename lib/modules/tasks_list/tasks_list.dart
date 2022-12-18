import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/modules/tasks_list/add-event.dart';
import 'package:to_do_app/modules/tasks_list/task_item.dart';
import 'package:to_do_app/shared/network/local/firebase_utils.dart';
import 'package:to_do_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../layout/add_task_bottom_sheet.dart';
import '../../provider/my_provider.dart';
import '../../shared/components/components.dart';

class TasksListTab extends StatefulWidget {
  const TasksListTab({Key? key}) : super(key: key);

  @override
  State<TasksListTab> createState() => _TasksListTabState();
}



class _TasksListTabState extends State<TasksListTab> {
  DateTime CurrentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pro.mode == ThemeMode.dark
                            ? "Good Night"
                            : "Good Morning",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: pro.mode == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  defaultButton(
                      text: "Add Event",
                      width: 100,
                      onpress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddEvent()));
                        // Navigator.pushNamed(context, AddEvent());
                        //showAddTaskBottomSheet();
                      },
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.deepOrange,
                          Colors.deepOrange.shade400,
                          Colors.deepOrange.shade300,
                        ],
                      ),
                      radius: 15),
                ],
              ),
            ),
            CalendarTimeline(
              initialDate: CurrentDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                print(date);
                setState(() {
                  CurrentDate = date;
                });
              },
              leftMargin: 20,
              monthColor: colorBlack,
              dayColor: colorBlack,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: defaultLightColor,
              dotsColor: Colors.white,
              selectableDayPredicate: (date) => true,
              locale: 'en_ISO',
            ),
            StreamBuilder<QuerySnapshot<TaskData>>(
                stream: getTaskFromFirestore(CurrentDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                          color: defaultLightColor,
                        ),);
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Image.asset('assets/images/error.png'),
                    );
                  }
                  var tasks =
                      snapshot.data?.docs.map((doc) => doc.data()).toList() ??
                          [];
                  print(tasks);
                  if (tasks.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Image.asset('assets/images/no-data.png'),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskItem(tasks[index]);
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddEvent());
  }
}
