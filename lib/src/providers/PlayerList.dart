import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/models/Player.dart';

class PlayerList extends ChangeNotifier {
  List<Player> playerList = [];

  void addPlayer(Player p) {
    this.playerList.add(p);
    notifyListeners();
  }

  Player createPlayer() {
    Player p = Player('Joueur ${this.playerList.length + 1}');
    this.playerList.add(p);
    return p;
  }

  void removePlayer(Player p) {
    this.playerList.remove(p);
  }

  Player getPlayer(index) {
    return this.playerList[index];
  }

}

