import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_du_roi/src/models/GameCard.dart';
import 'package:jeu_du_roi/src/models/Mode.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/src/constants/constant_cards.dart' as ConstantCards;

class CardList extends ChangeNotifier {
  List<GameCard> cardList = [];
  int kingsGameCounter = 0;
  late int numberOfKingGameCard;
  late int nbCards;
  int currentCardIndex = -1;

  void addCard(GameCard p) {
    this.cardList.add(p);
    notifyListeners();
  }

  void removeLast() {
    this.cardList.removeLast();
    notifyListeners();
  }

  //Get the next card of the current game
  GameCard getNextCard() {
    currentCardIndex++;
    if (this.currentCardIndex < this.cardList.length) {
      GameCard gc = this.cardList[currentCardIndex];
      if (gc.cardId == 1)
        this.kingsGameCounter++;
      if (this.kingsGameCounter == this.numberOfKingGameCard) {
        this.kingsGameCounter = 0;
        return ConstantCards.CARD_ROI_DES_MELANGES;
      }
      return gc;
    }
    return ConstantCards.END_GAME;
  }

  GameCard? previousCard() {

    if(currentCardIndex > 0) {
      if(this.cardList[currentCardIndex].cardId == 1)
        this.kingsGameCounter--;
      currentCardIndex--;
      GameCard gc = this.cardList[currentCardIndex];
      return gc;
    }
    return null;
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
    while (this.cardList.length != this.nbCards) {
      int randInt = 0;
      bool isKinggameCard = true;
      while (isKinggameCard) {
        randInt = Random().nextInt(this.cardList.length);
        if (this.cardList[randInt].cardId != 1) isKinggameCard = false;
      }
      this.cardList.removeAt(randInt);
    }
  }

  Future<dynamic> loadCardList(int nPlayer, Mode mode) async {
    Map<dynamic, dynamic> jsonData;
    String jsonContent = await rootBundle.loadString(mode.path);
    jsonData = json.decode(jsonContent);
    List<dynamic> cards = jsonData['cards'];
    for (dynamic data in cards) {
      int quantity = data['number'];
      if (data['id'] == 1) {
        this.numberOfKingGameCard = quantity;
      }
      for (int i = 0; i < quantity; i++) {
        this.cardList.add(GameCard(
            cardId: data['id'], title: data['title'], text: data['text']));
      }
    }
    shuffle();
    //printDeck(); // For Debugging
    if(mode.name == 'Soft') {
      _setNumberOfCards(nPlayer); //Set the number of cards in function of player's number
      _removeExtraCards();
    }

    notifyListeners();
  }


  //Set number of cards in function of the number of player
  void _setNumberOfCards(int nbPlayer) {
    switch (nbPlayer) {
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

  GameCard getFirstCard() {
    GameCard gc = this.cardList.last;
    this.cardList.removeLast();
    return gc;
  }

void empty() {
    this.cardList = [];
    currentCardIndex = -1;
    kingsGameCounter = 0;
}

  // For Debugging purpose
  void printDeck() {
    developer.log(this.cardList.length.toString(), name: 'dev.print');
    for (GameCard gc in this.cardList) {
      developer.log(gc.toString(), name: 'dev.print');
    }
  }

}

