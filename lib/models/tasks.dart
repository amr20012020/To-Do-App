import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData{
  String id;
  String title;
  String description;
  int date;
  String time;
  bool isDone;

  TaskData({
    this.id = "",
    required this.date,
    required this.time,
    required this.title,
    required this.description,
    this.isDone = false
  });

  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "date" : date,
      "time" : time,
      "isDone" : isDone,
    };
  }

  TaskData.fromJson(Map<String, dynamic> json) : this(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    time: json["time"],
    isDone: json["isDone"],
  );

}