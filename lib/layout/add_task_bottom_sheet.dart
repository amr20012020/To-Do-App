import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/my_provider.dart';
import 'package:to_do_app/shared/styles/colors.dart';

import '../models/tasks.dart';
import '../shared/network/local/firebase_utils.dart';

class AddTaskBottomSheet extends StatefulWidget {

  final String title;
  final String description;
  final int date;


  AddTaskBottomSheet({required this.title,required this.description,required this.date});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState(
  title: title,
  description: description,
  date: date,
  );

}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final String title;
  final String description;
  final int date;


  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TaskData? task;

  _AddTaskBottomSheetState({required this.title, required this.description, required this.date, /*required this.task*/});

  /*final bool emailValid =
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);*/
  @override
  Widget build(BuildContext context) {
   // var provider = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Edit Task',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: colorBlack),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: formKey,
                child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  validator: (text){
                    if(text==''){
                      return 'Please Enter Title';
                    }
                    return null;
                  },
                  maxLength: 10,
                  decoration: InputDecoration(
                    label: Text('Enter Your Task Title'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  textInputAction: TextInputAction.done,
                  validator: (text){
                    if(text==''){
                      return 'Please Enter description';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: Text('Enter Your Task Details'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
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
                  onTap: (){
                    DisplayShowPicker(context);
                  //  provider.DisplayShowPicker(context);
                  },
                  child: Text(
                    '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FloatingActionButton(
                    shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        )
                    ),
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                       /* updateTaskFromFirestore(
                          widget.title,
                          task.description,
                          widget.date,
                        );*/
                        print('Done');
                      }
                    },
                    child: Icon(Icons.done,),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  void DisplayShowPicker(BuildContext context)async{
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate:  DateTime.now().add(Duration(days: 365)),
    );
    if(chosenDate == null)return;
    selectedDate = chosenDate;
    setState(() {

    });
  }
}

