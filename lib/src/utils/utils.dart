import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jeu_du_roi/src/theme/AppColors.dart';

Color genRandomBackground() {
  int randInt = Random().nextInt(10);
  return AppColors.gameBackgrounds[randInt];
}