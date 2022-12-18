import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/my_provider.dart';
import 'package:to_do_app/shared/styles/colors.dart';
import 'package:to_do_app/shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/styles/language_bottom_sheet.dart';
import '../../shared/styles/theme_bottom_sheet.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Settings",/*AppLocalizations.of(context)!.language,*/
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: pro.mode == ThemeMode.light ? Colors.black : Colors.white,),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                showLanguageBottomSheet(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: defaultLightColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: defaultLightColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Mode",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: pro.mode == ThemeMode.light ? Colors.black : Colors.white,),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showThemeBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: defaultLightColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pro.mode == ThemeMode.light ? "Light" : "Dark",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: defaultLightColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showLanguageBottomSheet(BuildContext context){
  showModalBottomSheet(
      context: context,
      builder: (context){
        return LanguageBottomSheet();
      });
}

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      });
}

/*Container(
margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
child: Column(
children: [
Text("Language", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: greenBackground),),
],
),
);*/
