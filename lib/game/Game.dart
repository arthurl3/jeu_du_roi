import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_du_roi/game/GameCard.dart';

class Game {
  final String cardsFilepath;
  late List<GameCard> cardList;
  late int kingsGameCounter;

  Game(this.cardsFilepath) {
    this.cardList = [];
    kingsGameCounter = 0;
  }

  // Fisher–Yates shuffle
  void shuffle() {
    developer.log("shuffle", name: 'dev.print');
    developer.log(this.cardList.length.toString(), name: 'dev.print');
    for (int i = 0; i < this.cardList.length - 2; i++) {
      int len = this.cardList.length;
      developer.log('length=$len', name: 'dev.print');
      int j = i + Random().nextInt(this.cardList.length - i);
      developer.log('j=$j', name: 'dev.print');
      GameCard tmp = this.cardList[i];
      this.cardList[i] = this.cardList[j];
      this.cardList[j] = tmp;
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
      for (int i = 0; i < quantity; i++) {
        this.cardList.add(GameCard(
            cardId: data['id'], title: data['title'], text: data['text']));
      }
    }
    shuffle();
    printDeck();
    rebuildParent();
  }

  GameCard getNextCard() {
    if (this.cardList.length > 0) {
      GameCard gc = this.cardList.last;
      this.cardList.removeLast();
      if(gc.cardId == 28) {
        this.kingsGameCounter++;
      }
      if(this.kingsGameCounter == 5)
        return GameCard(cardId: 666, title: 'LE ROI DES MELANGES', text: "Le dernier 'Roi des mélanges' est tombé. Bois le calice !");
      return gc;
    } else
      return GameCard(cardId: 777, title: 'FIN DE LA PARTIE', text: '');
  }

  GameCard getFirstCard() {
    GameCard gc = this.cardList.last;
    this.cardList.removeLast();
    return gc;
  }

  // For Debugging purpose
  void printDeck() {
    for (GameCard gc in this.cardList) {
      developer.log(gc.toString(), name: 'dev.print');
    }
  }
}
