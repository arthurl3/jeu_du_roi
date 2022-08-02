import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:jeu_du_roi/components/CustomTitle.dart';
import 'package:jeu_du_roi/components/PlayerRow.dart';
import 'package:jeu_du_roi/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/config/SizeConfig.dart';
import 'package:jeu_du_roi/game/Player.dart';
import 'package:jeu_du_roi/screens/GameScreen.dart';
import 'package:jeu_du_roi/theme/CustomColors.dart';

/// This is the stateful widget that the main application instantiates.
class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({Key? key}) : super(key: key);

  @override
  _PlayerSelectionScreen createState() => _PlayerSelectionScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PlayerSelectionScreen extends State<PlayerSelectionScreen> {
  late BuildContext context;
  late PlayerRow playerRow;
  List<TextEditingController> _controller = [];

  @override
  void initState() {
    this.playerRow = PlayerRow(
      controller: this._controller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    //Return on playerselectionscreen : Navigator.pop(context);

    SizeConfig().init(context);
    //developer.log(SizeConfig.screenWidth.toString(), name: 'dev.test');
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              margin: const EdgeInsets.only(top: 0.0, bottom: 0.0),
              width: double.infinity,
              height: SizeConfig.screenHeight! - SizeConfig.screenHeight! * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomTitle(context, Constants.PAGETITLE_PLAYERSELECTION),
                  playerRow,
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          //margin: const EdgeInsets.only(top: 100.0),
          height: 65.0,
          width: SizeConfig.screenWidth! / 2,
          child: FloatingActionButton.extended(
              backgroundColor: CustomColors.buttonBackground,
              label: Text(
                Constants.STRING_PLAYERBUTTON,
                style: Theme.of(context).textTheme.headline3,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.5, color: CustomColors.buttonBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                nextPage();
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<Player> getPlayerList() {
    List<Player> playerList = [];
    for (TextEditingController tec in this._controller) {
      playerList.add(Player(tec.text));
    }
    return playerList;
  }

  void nextPage() {
    List<Player> pl = getPlayerList();

    //Si la liste des joueurs n'est pas vide (au moins un joueur valide)
    if(pl.length > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(playerList: pl),
        ),
      );
    }
  }

}
