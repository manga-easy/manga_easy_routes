import 'package:flutter/material.dart';

abstract class MicroApp {
  void registerDependencies();
  abstract Map<String, Widget> routers;
}
