import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:jeu_du_roi/components/CustomTitle.dart';
import 'package:jeu_du_roi/components/PlayerRow.dart';
import 'package:jeu_du_roi/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/config/SizeConfig.dart';

/// This is the stateful widget that the main application instantiates.
class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({Key? key}) : super(key: key);

  @override
  _PlayerSelectionScreen createState() => _PlayerSelectionScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PlayerSelectionScreen extends State<PlayerSelectionScreen> {
  late BuildContext context;

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height:SizeConfig.screenHeight!-SizeConfig.screenHeight!*0.25,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PlayerRow(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: SizeConfig.screenWidth! / 2,
          child: FittedBox(
            child: FloatingActionButton.extended(
                label: Text(
                  Constants.STRING_PLAYERBUTTON,
                  style: Theme.of(context).textTheme.headline2,
                ),
                onPressed: () {}),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
