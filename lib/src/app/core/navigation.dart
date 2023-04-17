import 'package:flutter/material.dart';

class Navigation {
  final _key = GlobalKey<NavigatorState>();

  static final Navigation _instance = Navigation._();

  Navigation._();

  static Navigation get instance {
    return _instance;
  }

  GlobalKey<NavigatorState> get key => _key;
}
