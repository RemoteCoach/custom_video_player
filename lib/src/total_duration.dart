



import 'package:flutter/material.dart';

import '../native_video_view.dart';
import 'controller.dart';

class TotalDuration extends StatelessWidget {
  const TotalDuration({
    Key? key,
    this.fontSize,
    this.color,
    this.controller,
    this.totalduration

  }) : super(key: key);

  final double? fontSize;
  final Color? color;
  final VideoViewController? controller;
  final int? totalduration;


  @override
  Widget build(BuildContext context) {

    Duration? duration = Duration(milliseconds:totalduration ?? 0);

    String? durationInSeconds = duration != null
        ? (duration - Duration(minutes: duration.inMinutes))
        .inSeconds
        .toString()
        .padLeft(2, '0')
        : null;

    String textDuration =
    duration != null ? '${duration.inMinutes}:$durationInSeconds' : '0:00';

    return Padding(
      padding: const EdgeInsets.only(right: 16.0,bottom: 16),
      child: Text(
        textDuration,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white
        ),
      ),
    );
  }
}
