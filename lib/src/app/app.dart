import 'package:flutter/material.dart';
import 'package:security_cam/src/app/modules/video_list/presentation/pages/video_player_page.dart';

import 'core/navigation.dart';
import 'core/routes.dart';
import 'modules/auth/presentation/pages/auth_page.dart';
import 'modules/video_list/presentation/pages/video_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SECURITY CAM',
      navigatorKey: Navigation.instance.key,
      theme: ThemeData(),
      home: const AuthPage(),
      routes: {
        Routes.authPage: (context) => const AuthPage(),
        Routes.videoListPage: (context) => const VideoListPage(),
        Routes.videoPlayerPage: (context) => const VideoPlayerPage(),
      },
    );
  }
}
