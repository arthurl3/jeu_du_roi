import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeu_du_roi/src/components/core/CustomTitle.dart';
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/models/Mode.dart';
import 'package:jeu_du_roi/src/providers/CardList.dart';
import 'package:jeu_du_roi/src/providers/ModeList.dart';
import 'package:jeu_du_roi/src/providers/PlayerList.dart';
import 'package:jeu_du_roi/src/screens/GameScreen.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
import 'package:provider/provider.dart';

class ModeSelectionScreen extends StatefulWidget {
  const ModeSelectionScreen({Key? key}) : super(key: key);

  @override
  _ModeSelectionScreen createState() => _ModeSelectionScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ModeSelectionScreen extends State<ModeSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        title: CustomTitle(context, Constants.PAGETITLE_MODESELECTION),
        backgroundColor: Colors.black,
        leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 30),
              onPressed: () {
                returnToSelectionScreen();
              }),
        actions: [
          SizedBox(
            width: 35
          )
        ],

      ),
      body: Consumer<ModeList>(
        builder: (context, ml, child) {
          List<Mode> modeList = ml.getModeList();
          return ListView.builder(
            itemCount: modeList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    title:Text(modeList[index].name,
                      style:TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.white,
                        fontSize: 21,
                        height: 1.4,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    subtitle: Text(modeList[index].description,
                      style:TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.4,
                      ),),
                  ),
                ),
                onTap: (){
                  gotoGame(modeList[index]);
                },
              );
            },
          );
        },
      ),
    );
  }

  void gotoGame(Mode mode) {
    CardList cardList = Provider.of<CardList>(context, listen: false);
    PlayerList playerList = Provider.of<PlayerList>(context, listen: false);

    cardList.loadCardList(playerList.getSize(), mode).then((_) {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => GameScreen()),
      );
    });
  }

  void returnToSelectionScreen() {
    Provider.of<PlayerList>(context, listen: false).empty();
    Navigator.pop(context);
  }

}
