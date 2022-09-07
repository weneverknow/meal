import 'package:flutter/material.dart';

abstract class GeneralText {
  String text = '';
  Color? color;
  TextAlign textAlign = TextAlign.start;
}

class TitleText extends GeneralText {
  Widget child() => Text(
        text,
        style:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: color),
        maxLines: 1,
        textAlign: textAlign,
        overflow: TextOverflow.clip,
      );
}

class SubtitleText extends GeneralText {
  Widget get child => Text(
        text,
        style:
            TextStyle(fontSize: 11, fontWeight: FontWeight.w300, color: color),
        textAlign: textAlign,
      );
}
