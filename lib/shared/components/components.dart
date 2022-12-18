import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton(
    {double width = double.infinity,
      Color background = Colors.blue,
      VoidCallback? onpress,
      required String text,
      double radius = 0,
      double height = 40,
      LinearGradient? gradient,
      bool? isUppercase}) =>
    Container(
      width: width,
      child: MaterialButton(
        height: height,
        onPressed: onpress,
        child: Text(
          (isUppercase != null && isUppercase) ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: background,
          gradient: gradient),
    );


ShowLoading(BuildContext context, String message){
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context)=>AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 5,
              ),
              Text(message),
            ],
          ),
        ),
      ));
}

HideLoading(BuildContext context){
  Navigator.pop(context);
}


void showMessage(BuildContext context,String message, String posBtn, VoidCallback posAction){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text(message),
      actions: [
        TextButton(
            onPressed: posAction,
            child: Text(posBtn)),
      ],
    );
  });
}