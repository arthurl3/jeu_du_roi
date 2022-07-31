import 'package:flutter/material.dart';
import 'package:jeu_du_roi/config/SizeConfig.dart';
import 'dart:developer' as developer;

class PlayerRow extends StatefulWidget {
  @override
  _PlayerRow createState() => _PlayerRow();
}

class _PlayerRow extends State<PlayerRow> {
  late BuildContext context;
  List<TextEditingController>? _controllers = [];
  int keyMap = 0;
  List<Widget> _playerRowList = [];

  @override
  void initState() {
    super.initState();
    _playerRowList.add(_playerRow());
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    SizeConfig().init(context);

    return Container(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _playerRowList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _playerRowList[index];
              }),
          IconButton(
              icon: Icon(Icons.add_circle_outline_outlined),
              iconSize: 40,
              color: Colors.green,
              onPressed: () {
                setState(() {
                  _playerRowList.add(_playerRow());
                });
              }),
        ],
      ),
    );
  }

  Widget _playerRow() {
    late Row pRow;
    pRow = Row(
      key: UniqueKey(),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth! / 2,
          height: 40.0,
          child: //LISTVIEW
              TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 4.0, color: Colors.lightBlue.shade50)),
              labelText: 'Enter Name',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.highlight_remove_outlined),
          iconSize: 30,
          color: Colors.redAccent,
          onPressed: () {
            setState(() {
              _playerRowList.remove(pRow);
            });
          },
        ),
      ],
    );
    return pRow;
  }
}
