import 'package:flutter/material.dart';
import 'package:jeu_du_roi/components/CustomTitle.dart';
import 'package:jeu_du_roi/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/config/SizeConfig.dart';
import 'package:jeu_du_roi/game/Game.dart';
import 'package:jeu_du_roi/game/GameCard.dart';
import 'package:jeu_du_roi/game/Player.dart';
import 'package:jeu_du_roi/theme/CustomColors.dart';
import 'package:jeu_du_roi/utils/utils.dart';

/// This is the stateful widget that the main application instantiates.
class GameScreen extends StatefulWidget {

  final List<Player> playerList;

  const GameScreen({Key? key, required this.playerList}) : super(key: key);

  @override
  _GameScreen createState() => _GameScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _GameScreen extends State<GameScreen> {//with RestorationMixin{
  late BuildContext context;
  late GameCard currentCard;
  late Game game;
  late int currentPlayer;
  late Color gameBackgroundColor;

  @override
  void initState() {
    currentCard = GameCard(cardId: 111, title: 'DEBUT', text: '');
    super.initState();
    game = Game(Constants.STRING_HEAVYMODEFILEPATH);
    game.loadCardList(rebuild);
    gameBackgroundColor = genRandomBackground();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    SizeConfig().init(context);
    //developer.log(SizeConfig.screenWidth.toString(), name: 'dev.test');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            nextCard();
          },
          child: Container(
            color: gameBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top:70.0),
              child:Column(
                  children:[
                    Center(
                      child: Text(
                        currentCard.title,
                        textAlign: TextAlign.center,
                         style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0),
                      child: Center(
                         child: Text(
                           widget.playerList[currentPlayer].name,
                           textAlign: TextAlign.center,
                           style: Theme.of(context).textTheme.headline5,
                         )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5.0, right:10.0),
                      child: Center(
                        child: Text(
                          currentCard.text,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }

  // To give setState method outside the class in Game.loadCardList
  void rebuild() {
    setState(() {
      this.currentPlayer = 0;
      this.currentCard = game.getFirstCard();
    });
  }

  // Click Event on screen : Change card but also player and the background color
  void nextCard() {
    setState(() {
      if(currentPlayer == widget.playerList.length-1)
        currentPlayer = 0;
      else
        currentPlayer++;
      gameBackgroundColor = genRandomBackground();
      currentCard = game.getNextCard();
    });
  }

  // @override
  // String? get restorationId => "GameScreen";
  //
  // @override
  // void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
  //   registerForRestoration(property, "game");
  // }
}