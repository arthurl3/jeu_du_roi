import 'package:flutter/material.dart';

class CustomTitle extends Container {
  CustomTitle(BuildContext context, String pageTitle)
      : super(
    alignment: Alignment.center,
    child: Text(
      pageTitle,
      style: Theme.of(context).textTheme.headline1,
    ),
  );
}