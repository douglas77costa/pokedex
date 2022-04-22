import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_widget.dart';
import 'app/core/shared/infra/models/pokemon_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadUi();
  await _initHive();
  runApp(const AppWidget());
}

void loadUi() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

Future _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonModelAdapter());
  return await Hive.openBox('pokemon');
}
