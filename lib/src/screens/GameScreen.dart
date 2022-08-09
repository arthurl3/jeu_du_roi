import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jeu_du_roi/src/components/game_screen/delete_player_modal.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/src/constants/constant_cards.dart' as ConstantsCards;
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/models/GameCard.dart';
import 'package:jeu_du_roi/src/models/Player.dart';
import 'package:jeu_du_roi/src/providers/CardList.dart';
import 'package:jeu_du_roi/src/providers/PlayerList.dart';
import 'package:jeu_du_roi/src/utils/utils.dart';
import 'package:provider/provider.dart';

/// This is the stateful widget that the main application instantiates.
class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreen createState() => _GameScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _GameScreen extends State<GameScreen> {
  late GameCard currentCard;
  late Player currentPlayer;
  late Color gameBackgroundColor;
  late CardList cardList;
  late PlayerList playerList;

  @override
  void initState() {
    super.initState();
    gameBackgroundColor = genRandomBackground();
    cardList = Provider.of<CardList>(context, listen: false);
    playerList = Provider.of<PlayerList>(context, listen: false);
    currentPlayer = playerList.getNextPlayer();
    currentCard = cardList.getNextCard();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            key: UniqueKey(),
            elevation: 0,
            backgroundColor: gameBackgroundColor,
            toolbarHeight: 80,
            leading: Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 35),
                  onPressed: () {
                    quit();
                  }),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right:12.0),
                child: IconButton(
                  icon: Icon(Icons.person_remove_alt_1_outlined, size: 35),
                  onPressed: () {
                    showRemovePlayerModal();
                  },
                ),
              ),
            ]),
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (currentCard.cardId != 9999)
                  nextCard();
                else
                  quit();
              },
              child: Container(
                color: gameBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 80.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              currentCard.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                      ),
                      if (currentCard.cardId != 9999)
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    playerList.getPreviousPlayer().name,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    playerList.getNextToPlayPlayer().name,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/icons/arrow_down_right.png'),
                                        height: 50.0,
                                        width: 50.0),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 20.0),
                                      child: Text(
                                        currentPlayer.name,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    Image(
                                        image: AssetImage(
                                            'assets/icons/arrow_up_right.png'),
                                        height: 50.0,
                                        width: 50.0)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Center(
                          child: Text(
                            currentCard.text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 15.0,
              child: Container(
                color: Color.fromRGBO(215, 219, 221, 0.4),
                child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 40,
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    onPressed: () {
                      previousCard();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Click Event on screen : Change card but also player and the background color
  void nextCard() {
    setState(() {
      currentPlayer = playerList.getNextPlayer();
      currentCard = cardList.getNextCard();
      if (currentCard.hasReplacment())
        currentCard.replaceText(_genRandomPlayer());

      Color tmp = gameBackgroundColor;
      do gameBackgroundColor = genRandomBackground(); while (
          gameBackgroundColor == tmp);
    });
  }

  void previousCard() {
    setState(() {
      GameCard? tmp = cardList.previousCard();
      if (tmp != null) {
        currentCard = tmp;
        currentPlayer = playerList.previousPlayer();
      }
    });
  }

  //Génère un nom de joueur qui n'est pas celui du joueur actuel (pour certaines cartes)
  String _genRandomPlayer() {
    int randInt = 0;
    bool isCurrentPlayer = true;
    while (isCurrentPlayer) {
      randInt = Random().nextInt(playerList.getSize());
      if (playerList.getPlayer(randInt) != currentPlayer)
        isCurrentPlayer = false;
    }
    return playerList.getPlayer(randInt).name;
  }

  void removePlayer() {
    setState(() {
      // late Player player;
      // widget.playerList.remove(player);
    });
  }

  void showRemovePlayerModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return DeletePlayerModal();
        });
  }

  void quit() {
    Provider.of<CardList>(context, listen: false).empty();
    Provider.of<PlayerList>(context, listen: false).reset();
    Navigator.pop(context);
  }
}
