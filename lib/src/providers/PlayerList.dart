import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/models/Player.dart';
import 'dart:developer' as developer;

class PlayerList extends ChangeNotifier {
  List<Player> _playerList = [];
  int _size = 0;
  int currentPlayerIndex = -1;
  int previousPlayerIndex = -1;
  int nextPlayerIndex = -1;

  void addPlayer(Player p) {
    this._playerList.add(p);
    _size++;
  }

  void removePlayer(Player p) {
    this._playerList.remove(p);
    this._playerList.removeWhere((element) => element == null);
    _size--;
    this.printList();
  }

  int getSize() => this._size;
  Player getPlayer(int index) => this._playerList[index];

  void fillList(List<TextEditingController> tecList) {
    for(TextEditingController tec in tecList) {
      addPlayer(Player(tec.text));
    }
  }

  Player getNextPlayer() {
    if(this.currentPlayerIndex == -1)
      currentPlayerIndex = Random().nextInt(_size);
    else if(currentPlayerIndex == _size-1)
      currentPlayerIndex = 0;
    else
      currentPlayerIndex++;
    return this._playerList[currentPlayerIndex];

  }

  int getPreviousPlayer() {
    if(currentPlayerIndex == 0)
      previousPlayerIndex = _size - 1;
    else
      previousPlayerIndex = currentPlayerIndex - 1;
    return this._playerList[previousPlayerIndex];
  }

  int getNextPlayer() {
    if(currentPlayerIndex == _size - 1)
      nextPlayerIndex = 0;
    else
      nextPlayerIndex = currentPlayerIndex + 1;
    return this._playerList[nextPlayerIndex];
  }


  void empty() {
    this._playerList = [];
    currentPlayer = -1;
    _size = 0;
  }

  void printList() {
    for(int i = 0 ; i < this._playerList.length ; i++)
      developer.log(this._playerList[i].name, name: 'dev.debug');
  }
}

