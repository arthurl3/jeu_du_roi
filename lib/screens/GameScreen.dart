import 'package:flutter/material.dart';
import 'package:jeu_du_roi/components/CustomTitle.dart';
import 'package:jeu_du_roi/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/config/SizeConfig.dart';

/// This is the stateful widget that the main application instantiates.
class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreen createState() => _GameScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _GameScreen extends State<GameScreen> {
  late BuildContext context;
  late String cardTitle;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    SizeConfig().init(context);
    //developer.log(SizeConfig.screenWidth.toString(), name: 'dev.test');
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          title: CustomTitle(context, Constants.PAGETITLE_PLAYERSELECTION),
      ),
      body: Container(child:Text("Hey")),
    );
  }
}