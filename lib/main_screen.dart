import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flagg/data/flag/enum_layout.dart';
import 'package:flagg/widgets/dialogs/color/dialog_filter_color_box.dart';
import 'package:flagg/widgets/dialogs/layout/dialog_filter_layout_box.dart';
import 'package:flagg/widgets/dialogs/sign/dialog_filter_sign_box.dart';
import 'package:flagg/widgets/flag_tile.dart';
import 'package:flagg/widgets/floating_filter_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'data/database.dart';
import 'data/flag/enum_signs.dart';
import 'data/flag/flag.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final _myBox = Hive.box('mybox');
  FlaggDatabase db = FlaggDatabase();
  List<Flag> flagsFiltered = [];
  @override
  void initState() {
    if (_myBox.get('FLAGS') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    flagsFiltered = db.getFlags();
    super.initState();
  }

  List<FlagColor> colorList = [];
  List<FlagLayout> layoutList = [];
  List<FlagSign> signList = [];


  Flag prototype = Flag('', [], [], []);

  void onSave(){
    prototype.colors = colorList;
    prototype.layout = layoutList;
    prototype.signs = signList;
    setState((){
      flagsFiltered = db.filterByColor(prototype, db.getFlags());
      flagsFiltered = db.filterByLayout(prototype, flagsFiltered);
      flagsFiltered = db.filterBySign(prototype, flagsFiltered);
    });
    Navigator.of(context).pop();
  }

  void showDialogFilterColorBox() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogFilterColorBox(list: colorList, onSave: onSave);
      },
    );
  }

  void showDialogFilterLayoutBox() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogFilterLayoutBox(list: layoutList, onSave: onSave);
      },
    );
  }

  void showDialogFilterSignBox() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogFilterSignBox(list: signList, onSave: onSave);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /*for(var i in db.filter(Flag('', [FlagColor.black], FlagLayout.vertical, true), db.getFlags())){
      print(i.name);
    }*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          title: Text('Flagg Finder'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingFilterButton(
                onPressed: showDialogFilterLayoutBox,
                icon: const Icon(Icons.layers_outlined),
              ),
              FloatingFilterButton(
                onPressed: showDialogFilterColorBox,
                icon: const Icon(Icons.color_lens_outlined),
              ),
              FloatingFilterButton(
                onPressed: showDialogFilterSignBox,
                icon: const Icon(Icons.star_border),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: flagsFiltered.length,
          itemBuilder: (context, index) {
            return FlagTile(flag: flagsFiltered[index]);
          },
        ),
      ),
    );
  }
}
