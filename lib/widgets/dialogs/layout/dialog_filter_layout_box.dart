import 'dart:ffi';

import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flagg/data/flag/enum_layout.dart';
import 'package:flutter/material.dart';

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

