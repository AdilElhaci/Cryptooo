import 'package:cryptoo/core/database-helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/theme.dart';
import '../../core/models/crypto.model.dart';
import '../../core/provider/cryptolist/crypto_list_provider.dart';
import 'widgets/home_screen_card_list.dart';
import 'widgets/home_screen_floating_action_button.dart';
import 'widgets/home_screen_logo_title.dart';

class HomeSecreen extends StatefulWidget {
  const HomeSecreen({Key key}) : super(key: key);
  @override
  _HomeSecreenState createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
  List<CryptoModel> cryptoDataList = [];
  var db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    DatabaseHelper().getDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final cryptoManager = Provider.of<CryptoManager>(context);

    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Expanded(flex: 3, child: pageTitleAndLogo()),
              Expanded(
                  flex: 19,
                  child: homePageCardList(
                    cryptoManager.cryptoItems,
                  )),
              Expanded(flex: 2, child: homePageFloatingActionButton(context))
            ],
          ),
        ),
      ),
    );
  }
}
