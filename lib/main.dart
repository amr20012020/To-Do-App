import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/modules/splash.dart';
import 'package:to_do_app/modules/tasks_list/add-event.dart';
import 'package:to_do_app/provider/my_provider.dart';
import 'package:to_do_app/shared/styles/my_theme.dart';
import 'layout/home-layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var provider  = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        SplachScreen.routeName: (context) => SplachScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        AddEvent.routeName: (context) => AddEvent(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkThem,
      themeMode: provider.mode,
    );
  }
}
