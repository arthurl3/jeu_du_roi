import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_du_roi/src/screens/PlayerSelectionScreen.dart';
import 'package:provider/provider.dart';
import 'package:jeu_du_roi/src/theme/AppTheme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.black,
    ));
    return MaterialApp(
      title: 'Napusoif',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: PlayerSelectionScreen(),
    );
  }
}
