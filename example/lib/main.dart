import 'package:flutter/material.dart';
import 'package:native_video_view/native_video_view.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: _buildVideoPlayerWidget(),
    );
  }

  Widget _buildVideoPlayerWidget() {
    return Container(
      alignment: Alignment.center,
      child: NativeVideoView(
        keepAspectRatio: true,
        showMediaController: true,
        enableVolumeControl: true,
        autoHideTime: const Duration(seconds: 3),
        useExoPlayer: true,
        onCreated: (controller) {
          controller.setVideoSource(
            "https://rcwl-prod.s3.eu-west-2.amazonaws.com/files/15d8fd20-80fe-4829-9c28-8766ae5bbd25/PRE_AND_POST_NATAL/FINAL_FULL_BODY_PREG_WORKOUT_WITH_HILS.mp4",
            sourceType: VideoSourceType.network,
            requestAudioFocus: true,
          );
        },
        onProgress: (elapsedtime, duration) {
          debugPrint('NativeVideoView: current progress: $duration');
        },
        onPrepared: (controller, info) {
          debugPrint('NativeVideoView: Video prepared');
          controller.play();
        },
        onError: (controller, what, extra, message) {
          debugPrint(
              'NativeVideoView: Player Error ($what | $extra | $message)');
        },
        onCompletion: (controller) {
          debugPrint('NativeVideoView: Video completed');
        },
      ),
    );
  }
}
