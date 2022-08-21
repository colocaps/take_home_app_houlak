import 'package:flutter/material.dart';
import 'package:home_search/home_search.dart';
import 'package:houlak_take_home_app/application/application.dart';
import 'package:houlak_take_home_app/features/home_module/home_module.dart';
import 'package:houlak_take_home_app/ioc_manager.dart';
import 'package:sign_in/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerDependencies();
  runApp(const Application());
}

Future<void> _registerDependencies() async {
  IoCManager.registerDependencies();
  await HomeModule.registerDependencies();
  await HomeSearhcInitializer.registerDependencies();
  await SignInInitializer.registerDependencies();
}
