import 'package:flutter/material.dart';

import '../../../../core/navigation.dart';
import '../../../../domain/entities/recording/recording_entity.dart';
import '../../../../domain/usecases/security_recordings/get_security_recordings_usecase.dart';
import '../vos/data_video_recordings_vo.dart';

class SecurityRecordingsController {
  final GetSecurityRecordingsUsecase getSecurityRecordingsUsecase;
  ValueNotifier<RecordingEntity?> recording = ValueNotifier(RecordingEntity());
  DataVideoRecordingsVO recordingsVO = DataVideoRecordingsVO();

  SecurityRecordingsController({
    required this.getSecurityRecordingsUsecase,
  });

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await getSecurityRecordings(limit: 10);
  }

  Future<void> getSecurityRecordings({int? limit}) async {
    recording.value = RecordingEntity();
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      recording.value = await getSecurityRecordingsUsecase(limit: limit);
    } catch (e) {
      e.toString();
    }
  }

  void navigateTo({required String route, bool isNotReplace = false}) {
    Navigation.instance.key.currentState?.pushNamedAndRemoveUntil(
        route, (Route<dynamic> route) => isNotReplace);
  }

  void popToPage() {
    Navigation.instance.key.currentState?.pop();
  }

  void getDataVideo({required int index}) {
    recordingsVO = DataVideoRecordingsVO(
      title: recording.value?.data?[index].videoInfo?.title ?? "-",
      subTitle: recording.value?.data?[index].videoInfo?.subtitle ?? "-",
      url: recording.value?.data?[index].uri,
    );
  }
}
