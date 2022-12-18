import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/my_provider.dart';
import 'package:to_do_app/shared/styles/colors.dart';
import 'package:to_do_app/shared/styles/my_theme.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Column(
        children: [
           InkWell(
             onTap: (){
               pro.changeTheme(ThemeMode.light);
               Navigator.pop(context);
             },
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   'Light',
                   style: Theme.of(context).textTheme.headline1!.copyWith(
                     color: pro.mode == ThemeMode.dark ? greenBackground : defaultLightColor,
                   ),
                 ),
                 Icon(
                   Icons.done,
                   size: 30,
                   color: pro.mode == ThemeMode.dark ? greenBackground : defaultLightColor,
                 ),
               ],
             ),
           ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: (){
              pro.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: pro.mode == ThemeMode.dark ? defaultLightColor : greenBackground,
                  ),
                ),
                Icon(
                  Icons.done,
                  size: 30,
                  color: pro.mode == ThemeMode.dark ? defaultLightColor : greenBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
