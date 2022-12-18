import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/layout/home-layout.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/shared/network/local/firebase_utils.dart';
import 'package:to_do_app/shared/styles/colors.dart';

import '../../provider/my_provider.dart';
import '../../shared/components/components.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key? key}) : super(key: key);
  static const String routeName = 'AddEvent';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _appBar(),
      body: _buildAddTask(context),
    );
  }

  _buildAddTask(BuildContext context,) {
    var pro = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add New Task',
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
                      validator: (text){
                        if(text==''){
                          return 'Please Enter Title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Enter Your Task Title'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultLightColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      validator: (text){
                        if(text==''){
                          return 'Please Enter description';
                        }
                        return null;
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        label: Text('Enter Your Task Details'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultLightColor,
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
                          DateFormat.yMMMd().format(selectedDate).toString(),
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
                           String time = DateFormat("hh:mm a").format(DateTime.now());
                           //DateTime date = DateUtils.dateOnly(DateTime.now());
                          if(formKey.currentState!.validate()){
                            TaskData task = TaskData(
                              time: time,
                              date: selectedDate.day,
                              title: titleController.text,
                              description: descriptionController.text,
                            );
                            ShowLoading(context,'Loading...');
                            addTaskToFirebase(task).then((value){
                              HideLoading(context);
                              showMessage(
                                  context,
                                  'Task Added',
                                  'OK', () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => HomeLayout()));
                            }).catchError((error){
                              print(error);
                            });
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

  _appBar(){
    return AppBar(
      backgroundColor: defaultLightColor,
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.white,),
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeLayout()));
        },
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
