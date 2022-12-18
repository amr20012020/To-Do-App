import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';

CollectionReference<TaskData> getTasksCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<TaskData>(
      fromFirestore: (snapshot, SP) => TaskData.fromJson(snapshot.data()!),
      toFirestore: (task, sp) => task.toJson());
}

Future<void> addTaskToFirebase(TaskData taskData) {
  var collection = getTasksCollection();
  var docRef = collection.doc();
  taskData.id = docRef.id;
  return docRef.set(taskData);
}

Stream<QuerySnapshot<TaskData>> getTaskFromFirestore(DateTime dateTime) {
  return getTasksCollection()
      .where('date', isEqualTo: dateTime.day)
      .snapshots();
}

Future<void> deleteTaskFromFirestore(String id){
  return getTasksCollection().doc(id).delete();
}


Future<void> updateTaskFromFirestore(String id, TaskData task){
  return getTasksCollection().doc(id).update({
    'title' : task.title,
    'description' : task.description,
    'date' : task.date,
    'time' : task.time,
  }).then((value) => print("Task Updated")).catchError((error) => print("Failed to Update"));
}
