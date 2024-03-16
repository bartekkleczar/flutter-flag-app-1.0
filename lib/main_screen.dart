import 'package:flagg/theme/theme_provider.dart';
import 'package:flagg/widgets/flag_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'data/database.dart';
import 'data/flag/flag.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final _myBox = Hive.box('mybox');
  FlaggDatabase db = FlaggDatabase();

  @override
  void initState() {
    if (_myBox.get('FLAGS') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*for(var i in db.filter(Flag('', [FlagColor.black], FlagLayout.vertical, true), db.getFlags())){
      print(i.name);
    }*/
    List<Flag> flags = db.getFlags();
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flagg Finder'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: flags.length,
          itemBuilder: (context, index){
            return FlagTile(flag: flags[index]);
          },
        ),
      ),
    );
  }
}
