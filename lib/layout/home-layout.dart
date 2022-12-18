import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/layout/add_task_bottom_sheet.dart';
import 'package:to_do_app/modules/settings/settings.dart';
import 'package:to_do_app/modules/tasks_list/tasks_list.dart';
import 'package:to_do_app/shared/network/local/firebase_utils.dart';
import 'package:to_do_app/shared/styles/colors.dart';

import '../modules/tasks_list/add-event.dart';
import '../provider/my_provider.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  final appbar_title = ["My Events", "Settings", "Done Events", "Archive Events",];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      drawer: _drawer(context),
      appBar: AppBar(
        title: Text(
          appbar_title[currentIndex],
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                  pro.mode == ThemeMode.dark ? Icons.search : Icons.search,
                  size: 30,
              ),
          ),
          IconButton(
            onPressed: () {
              pro.onchangeTheme();
            },
            icon: Icon(
              pro.mode == ThemeMode.dark ? Icons.wb_sunny : Icons.mode_night,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      /*AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarDividerColor: colorBlack,
          systemNavigationBarColor: colorBlack,
        ),
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: (){
            pro.changeTheme(ThemeMode.dark);
          },
          child: Icon(pro.mode == ThemeMode.light ? Icons.nightlight_round : Icons.light_mode,size: 20,),
        ),
        actions: [
          Icon(Icons.person,size: 20,),
          SizedBox(width: 20,),
        ],
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: defaultLightColor,
        shape: StadiumBorder(
            side: BorderSide(
          color: pro.mode == ThemeMode.light ? Colors.white : bottomdark,
          width: 3,
        )),
        onPressed: () {

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEvent()));
          //showAddTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 60,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor:
              pro.mode == ThemeMode.light ? Colors.transparent : bottomdark,
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddEvent());
  }

  /*_appBar(BuildContext context) => AppBar(
    title: Text(
      "Title",
      style: Theme.of(context).textTheme.headline5,
    ),
    actions: [
      IconButton(
          onPressed: (){},
          icon: Icon(
            pro.mode == ThemeMode.light ?Icons.search : Icons.search,
            size: 30,
          )),
    ],
  );*/


  _drawer(BuildContext context) => Drawer(
    child: Column(
      children: [
        Container(
        //  decoration: BoxDecoration(gradient: orangeGradient),
          padding: EdgeInsets.only(left: 15, right: 15, top: 40),
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/default-profile.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cloud),
                      color: defaultLightColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "SIGN IN",
                style: TextStyle(
                    letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
              Text(
                "Synchronization disabled...",
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {

          },
          leading: Icon(Icons.delete,color: defaultLightColor,),
          title: Text("Clear Data"),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.search,color: defaultLightColor,),
          title: Text("Search"),
        ),
      ],
    ),
  );

  List<Widget> tabs = [
    TasksListTab(),
    SettingsTab(),
  ];
}
