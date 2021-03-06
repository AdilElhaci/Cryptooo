import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/provider/cryptolist/crypto_list_provider.dart';
import 'core/provider/cryptolist/cypto_textfield_provider.dart';
import 'core/provider/cryptolist/dropdown_value_provider.dart';
import 'core/service/shared_preferances.dart';
import 'screens/calculator/calculator_screen.dart';
import 'screens/cryptoanalysis/crypto_analysis_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedService().getDataStatus();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CryptoManager>(
        create: (context) => CryptoManager(),
      ),
      ChangeNotifierProvider<DropdownValueProvider>(
        create: (context) => DropdownValueProvider(),
      ),
      ChangeNotifierProvider<CryptoTextfieldsProvider>(
        create: (context) => CryptoTextfieldsProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptoo',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        '/cryptooanlysis': (BuildContext context) => CryptoAnalysisScreen(
              cryptoModel: null,
            ),
        '/home': (BuildContext context) => HomeSecreen(),
        '/calculator': (BuildContext context) => CalculatorScreen(),
      },
    );
  }
}
