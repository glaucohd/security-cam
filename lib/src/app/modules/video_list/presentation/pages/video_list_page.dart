import 'package:flutter/material.dart';
import 'package:security_cam/src/app/core/injector.dart';
import 'package:security_cam/src/app/modules/video_list/presentation/widgets/text_widget.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/constants.dart';
import '../../../../core/routes.dart';
import '../controllers/security_recordings_controller.dart';
import '../widgets/list_tile_widget.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({super.key});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late SecurityRecordingsController controller;
  bool isNullSelected = false;

  @override
  void initState() {
    super.initState();
    controller = getIt<SecurityRecordingsController>();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              final limit = int.tryParse(result);

              controller.getSecurityRecordings(
                limit: limit == 0 ? null : limit,
              );
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: '10',
                child: TextWidget(
                  text: Constants.value10,
                  fontSize: 15,
                ),
              ),
              const PopupMenuItem<String>(
                value: '20',
                child: TextWidget(
                  text: Constants.value20,
                  fontSize: 15,
                ),
              ),
              const PopupMenuItem<String>(
                value: '-1',
                child: TextWidget(
                  text: Constants.valueMinus1,
                  fontSize: 15,
                ),
              ),
              const PopupMenuItem<String>(
                value: '-2',
                child: TextWidget(
                  text: Constants.valueMinus2,
                  fontSize: 15,
                ),
              ),
              const PopupMenuItem<String>(
                value: "0",
                child: TextWidget(
                  text: Constants.valueNull,
                  fontSize: 15,
                ),
              ),
            ],
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.primaryText,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          Constants.securityRecordingsPageTitle,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.recording,
        builder: (_, recording, __) {
          if (recording == null || recording.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.green,
              ),
            );
          }

          final recordingLength = recording.data?.length ?? 0;
          return recordingLength == 0
              ? Center(
                  child: Text(
                    recording.status?.message ?? Constants.noVideosFoundMessage,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    itemCount: recordingLength,
                    separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      color: AppColors.grey,
                      height: 0.5,
                    ),
                    itemBuilder: (context, index) {
                      return ListTileWidget(
                        onTap: () {
                          controller.getDataVideo(index: index);
                          controller.navigateTo(
                            route: Routes.videoPlayerPage,
                            isNotReplace: true,
                          );
                        },
                        title: recording.data?[index].locationInfo?.name,
                        subTitle: recording
                            .data?[index].locationInfo?.address?.address,
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
