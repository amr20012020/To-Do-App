import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/modules/tasks_list/task-edit.dart';
import 'package:to_do_app/shared/network/local/firebase_utils.dart';
import 'package:to_do_app/shared/styles/colors.dart';

import '../../layout/add_task_bottom_sheet.dart';
import '../../provider/my_provider.dart';

class TaskItem extends StatefulWidget {
  TaskData task;

  TaskItem(this.task);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteTaskFromFirestore(widget.task.id);
            },
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            icon: Icons.delete,
            label: 'Delete',
          ),
          SizedBox(
            width: 10,
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditEvent(
                  task: widget.task,
                ),
              ));
            },
            backgroundColor: Colors.green,
            borderRadius: BorderRadius.circular(12),
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 4,
              color: defaultLightColor,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.task.description,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 20, color: Colors.black),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/timer.png',
                        height: 14,
                        width: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.task.time,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState((){
                  click = !click;
                });
              },
              child: Icon((click = false) ? Icons.done_all : Icons.done)
            ),
          ],
        ),
      ),
    );
  }
}
