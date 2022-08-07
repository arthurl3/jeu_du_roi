import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/components/core/CustomTitle.dart';
import 'package:jeu_du_roi/src/components/selection_screen/PlayerRowList.dart';
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/providers/CardList.dart';
import 'package:jeu_du_roi/src/providers/PlayerList.dart';
import 'package:jeu_du_roi/src/screens/GameScreen.dart';
import 'package:jeu_du_roi/src/theme/AppColors.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
import 'package:provider/provider.dart';

class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({Key? key}) : super(key: key);

  @override
  _PlayerSelectionScreen createState() => _PlayerSelectionScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PlayerSelectionScreen extends State<PlayerSelectionScreen> {

  late PlayerRowList playerRow;

  @override
  void initState() {
    super.initState();
    playerRow = PlayerRowList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer2<CardList, PlayerList>(
      builder: (context, cd, pl, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 75.0,
            title: CustomTitle(context, Constants.PAGETITLE_PLAYERSELECTION),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                  width: double.infinity,
                  height:
                      SizeConfig.screenHeight! - SizeConfig.screenHeight! * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      playerRow,
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(top: 0.0, bottom: 0.0),
            height: 100.0,
            width: SizeConfig.screenWidth!,
            child: FloatingActionButton.extended(
                backgroundColor: AppColors.buttonLauchGame,
                label: Text(
                  Constants.STRING_PLAYERBUTTON,
                  style: Theme.of(context).textTheme.headline3,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.buttonBorder),
                ),
                onPressed: () {
                  nextPage();
                }),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      }
    );
  }

  void nextPage() {
    //S'il y a au moins deux joueurs
    if (playerRow.controllersList.length > 1) {
      CardList cardList = Provider.of<CardList>(context, listen: false);
      PlayerList playerList = Provider.of<PlayerList>(context, listen: false);
      playerList.fillList(playerRow.controllersList);

      cardList.loadCardList(playerList.getSize()).then((_) {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => GameScreen()),
        );
      });
    }
  }
}
