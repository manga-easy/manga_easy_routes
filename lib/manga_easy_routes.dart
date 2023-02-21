library manga_easy_routes;

import 'package:flutter/material.dart';

export 'src/core/easy_navigator.dart';
export 'src/core/easy_routes.dart';
export 'src/features/export_features.dart';

abstract class EasyArguments {}

abstract class MicroApp {
  void registerDependencies();
  abstract Map<String, Widget> routers;
}
