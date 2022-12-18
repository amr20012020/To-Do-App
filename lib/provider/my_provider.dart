import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/shared/network/local/firebase_utils.dart';

class MyProvider extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light;
  var isDarkMode = false;
  //late TaskData task;





  void changeTheme(ThemeMode themeMode){
    mode = themeMode;
    notifyListeners();
  }

  void onchangeTheme(){
    if(isDarkMode){
      changeTheme(ThemeMode.light);
      print("Light");
    }else{
      changeTheme(ThemeMode.dark);
      print("Dark");
    }
  }





}