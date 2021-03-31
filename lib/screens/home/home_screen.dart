import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_card_list.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_floating_action_button.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_logo_title.dart';
import 'package:flutter/material.dart';

class HomeSecreen extends StatefulWidget {
  @override
  _HomeSecreenState createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(flex: 3, child: pageTitleAndLogo()),
            Expanded(flex: 19, child: homePageCardList()),
            Expanded(flex: 2, child: homePageFloatingActionButton(context))
          ],
        ),
      ),
    );
  }
}
