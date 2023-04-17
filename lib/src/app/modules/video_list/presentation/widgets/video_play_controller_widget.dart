import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/app_colors.dart';

class VideoPlayControllerWidget extends StatefulWidget {
  final VideoPlayerController videoController;

  const VideoPlayControllerWidget({
    super.key,
    required this.videoController,
  });

  @override
  State<VideoPlayControllerWidget> createState() =>
      _VideoPlayControllerWidgetState();
}

class _VideoPlayControllerWidgetState extends State<VideoPlayControllerWidget> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isPlayingNotifier = ValueNotifier<bool>(false);
    ValueNotifier<double> playbackSpeedNotifier = ValueNotifier<double>(1.0);
    List<double> playbackSpeeds = [0.5, 1.0, 1.5, 2.0];

    void togglePlayPause() {
      isPlayingNotifier.value = !isPlayingNotifier.value;
      if (isPlayingNotifier.value) {
        widget.videoController.play();
      } else {
        widget.videoController.pause();
      }
    }

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: togglePlayPause,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: isPlayingNotifier,
                builder: (context, isPlaying, _) {
                  return Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 32.0,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: VideoProgressIndicator(
              widget.videoController,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: AppColors.green,
                bufferedColor: AppColors.grey,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ValueListenableBuilder<double>(
              valueListenable: playbackSpeedNotifier,
              builder: (BuildContext context, double value, Widget? child) {
                return DropdownButton<double>(
                  value: value,
                  onChanged: (double? speed) {
                    if (speed != null) {
                      playbackSpeedNotifier.value = speed;
                      widget.videoController.setPlaybackSpeed(speed);
                    }
                  },
                  items: playbackSpeeds
                      .map(
                        (speed) => DropdownMenuItem<double>(
                          value: speed,
                          child: Text(
                            '$speed x',
                            style: const TextStyle(
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
