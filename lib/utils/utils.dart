import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jeu_du_roi/constants/constants.dart';
import 'package:jeu_du_roi/theme/CustomColors.dart';

Color genRandomBackground() {
  int randInt = Random().nextInt(10);
  return CustomColors.gameBackgrounds[randInt];
}