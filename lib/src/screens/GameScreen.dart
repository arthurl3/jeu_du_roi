import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
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
  //with RestorationMixin{
  late GameCard currentCard;
  late int currentPlayer;
  late Color gameBackgroundColor;
  late CardList cardList;
  late PlayerList playerList;

  @override
  void initState() {
    super.initState();
    this.currentPlayer = 0;
    currentCard = GameCard(cardId: 111, title: 'DEBUT', text: '');
    gameBackgroundColor = genRandomBackground();
    cardList = Provider.of<CardList>(context, listen: true);
    playerList = Provider.of<PlayerList>(context, listen: true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder<void>(
      future: cardList.loadCardList(playerList.playerList.length),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                    key: UniqueKey(),
                    backgroundColor: gameBackgroundColor,
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.person_remove_alt_1_outlined),
                        onPressed: () {},
                      ),
                    ]),
                body: GestureDetector(
                  onTap: () {
                    nextCard();
                  },
                  child: Container(
                    color: gameBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Text(
                                currentCard.title,
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, bottom: 20.0),
                            child: Center(
                                child: Text(
                                  Provider
                                      .of<PlayerList>(context, listen: false)
                                      .playerList[currentPlayer]
                                      .name,
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0),
                            child: Center(
                              child: Text(
                                currentCard.text,
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1,
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        }
      });
  }

  // Click Event on screen : Change card but also player and the background color
  void nextCard() {
    setState(() {
      if (currentPlayer ==
          Provider.of<PlayerList>(context, listen: false).playerList.length - 1)
        currentPlayer = 0;
      else
        currentPlayer++;
      gameBackgroundColor = genRandomBackground();
      currentCard = Provider.of<CardList>(context, listen: false).getNextCard();
      if (currentCard.hasReplacment())
        currentCard.replaceText(_genRandomPlayer());
    });
  }

  //Génère un nom de joueur qui n'est pas celui du joueur actuel (pour certaines cartes)
  String _genRandomPlayer() {
    int randInt = 0;
    bool isCurrentPlayer = true;
    while (isCurrentPlayer) {
      randInt = Random().nextInt(
          Provider.of<PlayerList>(context, listen: false).playerList.length);
      if (Provider.of<PlayerList>(context, listen: false)
              .playerList[randInt]
              .name !=
          Provider.of<PlayerList>(context, listen: false)
              .playerList[currentPlayer]
              .name) isCurrentPlayer = false;
    }
    return Provider.of<PlayerList>(context, listen: false)
        .playerList[randInt]
        .name;
  }

  void removePlayer() {
    setState(() {
      // late Player player;
      // widget.playerList.remove(player);
    });
  }
}
