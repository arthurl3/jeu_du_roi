import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/config/SizeConfig.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;
import 'package:jeu_du_roi/src/theme/AppColors.dart';
import 'package:jeu_du_roi/src/components/selection_screen/PlayerRow.dart';

class PlayerRowList extends StatefulWidget {

  PlayerRowList({Key? key}) : super(key: key);

  @override
  _PlayerRowList createState() => _PlayerRowList();
}

class _PlayerRowList extends State<PlayerRowList> {
  List<Widget> _playerRowList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: _playerRowList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return _playerRowList[index];
            }
        ),
        if (_playerRowList.length < Constants.MAX_PLAYER)
          IconButton(
              icon: Icon(Icons.add_circle_rounded),
              iconSize: 35,
              color: Colors.green,
              onPressed: () => addPlayer()),
      ],
    );
  }

  void addPlayer() {
    setState(() {
      _playerRowList.add(row());
    });
  }

   Widget row() {
     PlayerRow playerRow = PlayerRow();
     late Row pRow;
     pRow = Row(
        key: UniqueKey(),
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           playerRow,
           IconButton(
             icon: Icon(Icons.cancel),
             iconSize: 30,
             color: AppColors.removeIcon,
             onPressed: () {
               _playerRowList.remove(pRow);
               setState(() {
               });
             },
           ),
         ]
     );
     return pRow;
   }

}
