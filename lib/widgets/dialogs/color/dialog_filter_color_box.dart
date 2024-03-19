import 'dart:ffi';

import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/material.dart';

import 'filter_color_option_tile.dart';

class DialogFilterColorBox extends StatelessWidget {
  final List<FlagColor> list;
  final VoidCallback onSave;

  DialogFilterColorBox({
    Key? key,
    required this.list,
    required this.onSave,
  }) : super(key: key);

  List<String> colorsString = [
    "red",
    "green",
    "blue",
    "black",
    "white",
    "yellow",
    "orange",
  ];

  List<FlagColor> colors = [
    FlagColor.red,
    FlagColor.green,
    FlagColor.blue,
    FlagColor.black,
    FlagColor.white,
    FlagColor.yellow,
    FlagColor.orange
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueAccent,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return FilterColorOptionTile(
                    list: list,
                    color: colors[index],
                    text: colorsString[index],
                  );
                },
              ),
            ),
            MaterialButton(
              onPressed: onSave,
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}

