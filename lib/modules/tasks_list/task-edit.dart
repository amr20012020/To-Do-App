import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../layout/home-layout.dart';
import '../../models/tasks.dart';
import '../../provider/my_provider.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/firebase_utils.dart';
import '../../shared/styles/colors.dart';

class EditEvent extends StatefulWidget {
  TaskData task;
  EditEvent({
    required this.task,
  });

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  late int selectedDate;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
    selectedDate = widget.task.date;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Event",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 2),
          ),
          child: Column(
            children: [
              Text(
                "Edit Task",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text == '') {
                      return 'Please Enter Title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Enter Your Task Title'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: defaultLightColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: defaultLightColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text == '') {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                  maxLines: 6,
                  decoration: InputDecoration(
                    label: Text('Enter Your Task Description'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: defaultLightColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: defaultLightColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Select Date',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: colorBlack),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  DisplayShowPicker(context);
                  //  provider.DisplayShowPicker(context);
                },
                child: Text(
                  selectedDate.toString(),
                  style: Theme.of(context).textTheme.subtitle1!,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  child: Text("Save Changes"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    String time = DateFormat("hh:mm a").format(DateTime.now());
                    TaskData task = TaskData(
                      date: DateTime.now().day,
                      time: time,
                      title: titleController.text,
                      description: descriptionController.text,
                    );
                    updateTaskFromFirestore(widget.task.id, task);
                   final snackBar =  SnackBar(
                      backgroundColor: defaultLightColor,
                      content: const Text("Task Upadated!"),
                      action: SnackBarAction(
                        textColor: Colors.white,
                        label: 'Undo',
                        onPressed: (){},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeLayout()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void DisplayShowPicker(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate == null) return;
    selectedDate = chosenDate as int;
    setState(() {});
  }
}
