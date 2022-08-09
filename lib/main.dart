import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/providers/ModeList.dart';
import 'package:jeu_du_roi/src/providers/PlayerList.dart';
import 'package:jeu_du_roi/src/providers/CardList.dart';
import 'package:jeu_du_roi/src/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlayerList>(create: (_) => PlayerList()),
        ChangeNotifierProvider<CardList>(create: (_) => CardList()),
        ChangeNotifierProvider<ModeList>(create: (_) => ModeList()),
      ],
      child: App(),
    );
  }
}
