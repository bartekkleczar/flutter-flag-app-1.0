import 'dart:ffi';

import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flagg/data/flag/enum_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../color/filter_color_option_tile.dart';
import 'filter_layout_option_tile.dart';

class DialogFilterLayoutBox extends StatelessWidget {
  final List<FlagLayout> list;
  final VoidCallback onSave;

  DialogFilterLayoutBox({
    super.key,
    required this.onSave, required this.list,
  });

  List<FlagLayout> layout = [
    FlagLayout.horizontal,
    FlagLayout.vertical,
    FlagLayout.middle,
    FlagLayout.diagonal,
  ];

  List<String> layoutString = [
    "horizontal",
    "vertical",
    "middle",
    "diagonal",
  ];
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              translate("filters.layouts.name"),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: layout.length,
                itemBuilder: (context, index) {
                  return FilterLayoutOptionTile(
                    list: list,
                    layout: layout[index],
                    text: layoutString[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: MaterialButton(
                onPressed: onSave,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                height: 40.0,
                child: Text(
                  translate('ui.Save'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

