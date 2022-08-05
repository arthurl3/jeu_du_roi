import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/models/Player.dart';
import 'package:jeu_du_roi/src/providers/PlayerList.dart';
import 'package:jeu_du_roi/src/theme/AppColors.dart';
import 'package:provider/provider.dart';

class PlayerRow extends StatefulWidget {

  final PlayerRowState playerRow = PlayerRowState();

  PlayerRow({Key? key}) : super(key: key);

  @override
  PlayerRowState createState() => PlayerRowState();

  void dispose() {
    playerRow.dispose();
  }

}

class PlayerRowState extends State<PlayerRow> {
  TextEditingController _controller = TextEditingController();
  late Player player;

  @override
  void initState() {
    player = Provider.of<PlayerList>(context, listen: false).createPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.screenWidth! / 2,
      height: 35.0,
      child: TextField(
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        controller: _controller,
        style: TextStyle(
          fontFamily: GoogleFonts.mulish().fontFamily,
        ),
        decoration: InputDecoration(
          labelText: player.name,
          labelStyle: TextStyle(
            color: AppColors.labelFontColor,
            fontSize: 16,
          ),
          floatingLabelStyle: TextStyle(
            color: AppColors.floatinglabelFontColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<PlayerList>(context, listen: false).removePlayer(this.player);
    this._controller.dispose();
    super.dispose();
  }
}
