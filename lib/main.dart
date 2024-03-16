import 'package:flagg/main_screen.dart';
import 'package:flagg/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}