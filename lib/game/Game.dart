import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:jeu_du_roi/game/GameCard.dart';
import 'package:jeu_du_roi/game/Player.dart';

class Game {
  final String cardsFilepath;
  late List<GameCard> cardList;
  late List<Player> playerList;
  late int kingsGameCounter;
  late int numberOfKingGameCard;
  late int nbCards;

  Game(this.cardsFilepath, this.playerList) {
    this.cardList = [];
    kingsGameCounter = 0;
  }

  // Fisher–Yates shuffle
  void shuffle() {
    for (int i = 0; i < this.cardList.length - 2; i++) {
      int len = this.cardList.length;
      int j = i + Random().nextInt(this.cardList.length - i);
      GameCard tmp = this.cardList[i];
      this.cardList[i] = this.cardList[j];
      this.cardList[j] = tmp;
    }
  }

  // Remove Extra cards in function of number of player
  void _removeExtraCards() {
    while(this.cardList.length != this.nbCards) {
      int randInt = 0;
      bool isKinggameCard = true;
      while(isKinggameCard) {
        randInt = Random().nextInt(this.cardList.length-1);
        if(this.cardList[randInt].cardId != 1)
          isKinggameCard = false;
      }
      this.cardList.removeAt(randInt);
    }
  }

  Future<String> _loadCards() async {
    return await rootBundle.loadString(this.cardsFilepath);
  }

  Future<void> loadCardList(Function rebuildParent) async {
    Map<dynamic, dynamic> jsonData;
    String jsonContent = await _loadCards();
    jsonData = json.decode(jsonContent);
    List<dynamic> cards = jsonData['cards'];
    for (dynamic data in cards) {
      int quantity = data['number'];
      if(data['id'] == 1) {
        this.numberOfKingGameCard = quantity;
      }
      for (int i = 0; i < quantity; i++) {
        this.cardList.add(GameCard(
            cardId: data['id'], title: data['title'], text: data['text']));
      }
    }
    shuffle();
    printDeck(); // For Debugging
    _getNumberOfCards(); //Set the number of cards in function of player's number
    _removeExtraCards();
    printDeck();
    rebuildParent();
  }

  GameCard getNextCard() {
    if (this.cardList.length > 0) {
      GameCard gc = this.cardList.last;
      this.cardList.removeLast();
      if(gc.cardId == 1) {
        this.kingsGameCounter++;
      }
      if(this.kingsGameCounter == this.numberOfKingGameCard) {
        this.kingsGameCounter = 0;
        return GameCard(cardId: 666, title: 'LE ROI DES MELANGES', text: "Le dernier 'Roi des mélanges' est tombé. Bois le calice !");
      }
      return gc;
    } else
      return GameCard(cardId: 777, title: 'FIN DE LA PARTIE', text: '');
  }

  GameCard getFirstCard() {
    GameCard gc = this.cardList.last;
    this.cardList.removeLast();
    return gc;
  }

  void _getNumberOfCards() {
    switch (this.playerList.length) {
      case 2:
        this.nbCards = 30;
        break;
      case 3:
        this.nbCards = 35;
        break;
      case 4:
        this.nbCards = 40;
        break;
      case 5:
        this.nbCards = 50;
        break;
      case 6:
        this.nbCards = 60;
        break;
      case 7:
        this.nbCards = 70;
        break;
      case 8:
        this.nbCards = 75;
        break;
      case 9:
        this.nbCards = 75;
        break;
      case 10:
        this.nbCards = 75;
        break;
      case 11:
        this.nbCards = 75;
        break;
      case 12:
        this.nbCards = 75;
        break;
    }
  }

  // For Debugging purpose
  void printDeck() {
    developer.log(this.cardList.length.toString(), name: 'dev.print');
    for (GameCard gc in this.cardList) {
      developer.log(gc.toString(), name: 'dev.print');
    }
  }



}
