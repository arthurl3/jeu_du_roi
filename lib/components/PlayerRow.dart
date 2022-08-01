import 'package:flutter/material.dart';
import 'package:jeu_du_roi/config/SizeConfig.dart';
import 'dart:developer' as developer;

import 'package:jeu_du_roi/theme/CustomColors.dart';

class PlayerRow extends StatefulWidget {

  List<TextEditingController> controller;

  PlayerRow({Key? key, required this.controller}) : super(key: key);

  @override
  _PlayerRow createState() => _PlayerRow();

}

class _PlayerRow extends State<PlayerRow> {
  late BuildContext context;
  int keyMap = 0;
  List<Widget> _playerRowList = [];

  @override
  void initState() {
    super.initState();
    widget.controller.add(TextEditingController());
    _playerRowList.add(_playerRow(widget.controller[0]));
  }

  @override
  void dispose() {
    for(TextEditingController textEditingController in widget.controller) {
      textEditingController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    SizeConfig().init(context);

    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: _playerRowList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return _playerRowList[index];
            },
        ),
        if(_playerRowList.length < 10)IconButton(
              icon: Icon(Icons.add_circle_rounded),
              iconSize: 35,
              color: Colors.green,
              onPressed: () => addPlayer()
          ),
      ],
    );
  }

  Widget? _addIconButton() {

  }

  void addPlayer() {
    setState(() {
      TextEditingController textEditingController = TextEditingController();
      widget.controller.add(textEditingController);
      _playerRowList.add(_playerRow(textEditingController));
    });
  }

  void removePlayer(Widget player, TextEditingController textEditingController) {
    setState(() {
      textEditingController.dispose();
      widget.controller.remove(textEditingController);
      _playerRowList.remove(player);
    });
  }

  Widget _playerRow(TextEditingController textEditingController) {
    String rowId = widget.controller.length.toString();
    late Row pRow;
    pRow = Row(
      key: UniqueKey(),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth! / 2,
          height: 35.0,
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 4.0, color: Colors.lightBlue.shade50)),
              labelText: 'Joueur $rowId',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.cancel),
          iconSize: 30,
          color: CustomColors.removeIcon,
          onPressed: () => removePlayer(pRow, textEditingController),
        ),
      ],
    );
    return pRow;
  }



}
