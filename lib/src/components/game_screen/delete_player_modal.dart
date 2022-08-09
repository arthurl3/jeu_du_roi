import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/models/Player.dart';
import 'package:jeu_du_roi/src/providers/PlayerList.dart';
import 'package:provider/provider.dart';

class DeletePlayerModal extends StatefulWidget {
  DeletePlayerModal({Key? key}) : super(key: key);

  @override
  _DeletePlayerModal createState() => _DeletePlayerModal();
}

class _DeletePlayerModal extends State<DeletePlayerModal> {
  late PlayerList playerListProvider;
  late List<Player> playerList;

  List<Widget> _buildList() {
    // cycle through the controllers, and recreate each, one per available controller
    return playerList.map<Widget>((Player player) {
      return Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
        child: Container(
          child: Row(
            children: [
              Text(
                player.name,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.mulish().fontFamily,
                ),
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  playerListProvider.removePlayer(player);
                },
              )
            ],
          ),
        ),
      );
    }).toList(); // convert to a list
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> children;
    return Consumer<PlayerList>(builder: (context, pl, child) {
      playerListProvider = pl;
      playerList = playerListProvider.getPlayerList();
      children = _buildList();
      return Container(
        color: Colors.amberAccent,
        height: 400,
        child: Wrap(
          children: children,
        ),
      );
    });
  }


  @override
  void initState() {
    super.initState();
  }
}
