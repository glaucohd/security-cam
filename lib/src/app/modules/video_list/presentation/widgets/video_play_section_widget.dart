import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/constants.dart';
import '../controllers/security_recordings_controller.dart';
import 'text_widget.dart';
import 'video_play_controller_widget.dart';

class VideoPlaySectionWidget extends StatelessWidget {
  const VideoPlaySectionWidget({
    super.key,
    required this.controller,
    required VideoPlayerController videoController,
  }) : _videoController = videoController;

  final SecurityRecordingsController controller;
  final VideoPlayerController _videoController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.recordingsVO.url != null,
      replacement: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: const AspectRatio(
          aspectRatio: 1.8,
          child: Center(
            child: TextWidget(
              textAlign: TextAlign.center,
              text: Constants.noVideosFoundMessage,
              color: AppColors.primaryText,
              fontSize: 22,
            ),
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1.8,
              child: Stack(
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  VideoPlayer(_videoController),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _videoController,
            builder: (_, value, __) {
              return Visibility(
                visible: value.position > Duration.zero,
                child: const SizedBox.shrink(),
              );
            },
          ),
          VideoPlayControllerWidget(videoController: _videoController)
        ],
      ),
    );
  }
}
