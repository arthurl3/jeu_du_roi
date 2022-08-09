import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/models/Mode.dart';
import 'package:jeu_du_roi/src/constants/constants.dart' as Constants;

class ModeList extends ChangeNotifier {
  List<Mode> _modeList = [
    Mode('Soft', Constants.STRING_BASEMODEFILEPATH, Constants.STRING_MODE_SOFT_DESCR),
    Mode('Origin', Constants.STRING_ORIGINALMODEFILEPATH, Constants.STRING_MODE_ORIGINAL_DESCR),
    Mode('Hard', Constants.STRING_BASEMODEFILEPATH, Constants.STRING_MODE_HARD_DESCR)
  ];
  int selectedMode = -1;

  List<Mode> getModeList() => this._modeList;

}

