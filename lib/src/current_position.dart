



import 'package:flutter/material.dart';

import '../native_video_view.dart';
import 'controller.dart';

class CurrentVideoPosition extends StatelessWidget {
  const CurrentVideoPosition({
    Key? key,
    this.fontSize,
    this.controller,
    this.color,
    this.currentposition,
  }) : super(key: key);

  final double? fontSize;
  final VideoViewController? controller;
  final Color? color;
  final int? currentposition;

  @override
  Widget build(BuildContext context) {

    Duration? position = Duration(milliseconds: (currentposition ?? 0));

    String? positionInSeconds = position != null
        ? (position - Duration(minutes: position.inMinutes))
        .inSeconds
        .toString()
        .padLeft(2, '0')
        : null;

    String textPosition =
    position != null ? '${position.inMinutes}:$positionInSeconds' : '0:00';

    return Padding(
      padding: const EdgeInsets.only(left: 16.0,bottom: 16),
      child: Text(
        textPosition,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
