import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:cryptoo/core/service/api.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_card_list.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_floating_action_button.dart';
import 'package:cryptoo/screens/home/widgets/home_screen_logo_title.dart';
import 'package:flutter/material.dart';

class HomeSecreen extends StatefulWidget {
  const HomeSecreen({Key key}) : super(key: key);
  @override
  _HomeSecreenState createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  List<CryptoModel> cryptoDataList = [];

  getData() async {
    await getCryptoData().then((value) {
      cryptoDataList = value;
      print('splasssssssssssh');
      print(cryptoDataList.length);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('home screen ');
    print(cryptoDataList.length);
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Expanded(flex: 3, child: pageTitleAndLogo()),
              Expanded(flex: 19, child: homePageCardList(cryptoDataList)),
              Expanded(flex: 2, child: homePageFloatingActionButton(context))
            ],
          ),
        ),
      ),
    );
  }
}
