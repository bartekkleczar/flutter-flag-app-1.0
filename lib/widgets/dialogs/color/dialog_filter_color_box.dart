import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
      backgroundColor: Colors.blueGrey,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              translate("filters.colors.name"),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.39,
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
