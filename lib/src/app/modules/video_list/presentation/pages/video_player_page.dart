import 'package:flutter/material.dart';
import 'package:security_cam/src/app/core/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants.dart';
import '../../../../core/injector.dart';
import '../controllers/security_recordings_controller.dart';
import '../widgets/text_widget.dart';
import '../widgets/video_play_section_widget.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoController;
  late SecurityRecordingsController controller;
  final ValueNotifier<bool> _isPlaying = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    controller = getIt<SecurityRecordingsController>();

    _initVideoPlay();
  }

  void _initVideoPlay() {
    if (controller.recordingsVO.url != null) {
      _videoController = VideoPlayerController.network(
        controller.recordingsVO.url ?? "-",
      )..initialize().then((_) {});
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    _isPlaying.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const TextWidget(
          text: Constants.images,
          color: AppColors.primaryText,
          fontSize: 18,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.popToPage();
          },
          color: AppColors.green,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _isPlaying,
        builder: (context, isPlaying, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextWidget(
                  text: controller.recordingsVO.title,
                  fontSize: 22,
                ),
                const SizedBox(height: 16),
                TextWidget(
                  textAlign: TextAlign.center,
                  text: controller.recordingsVO.subTitle,
                  color: AppColors.grey,
                  fontSize: 16,
                ),
                const SizedBox(height: 16),
                VideoPlaySectionWidget(
                  controller: controller,
                  videoController: _videoController,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
