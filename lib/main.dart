import 'package:flutter/material.dart';
import 'package:houlak_take_home_app/application/application.dart';
import 'package:houlak_take_home_app/features/home_module/home_module.dart';
import 'package:houlak_take_home_app/ioc_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerDependencies();
  runApp(const Application());
}

Future<void> _registerDependencies() async {
  IoCManager.registerDependencies();
  await HomeModule.registerDependencies();
}
