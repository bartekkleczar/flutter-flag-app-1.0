import 'dart:ffi';

import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flagg/data/flag/enum_layout.dart';
import 'package:flutter/material.dart';

import '../../../data/flag/enum_signs.dart';
import '../color/filter_color_option_tile.dart';
import 'filter_sign_option_tile.dart';

class DialogFilterSignBox extends StatelessWidget {
  final List<FlagSign> list;
  final VoidCallback onSave;

  DialogFilterSignBox({
    super.key,
    required this.onSave, required this.list,
  });

  List<FlagSign> sign = [
    FlagSign.none,
    FlagSign.other,
    FlagSign.bird,
    FlagSign.circle,
    FlagSign.crescent,
  ];

  List<String> signString = [
    "none",
    "other",
    "bird",
    "circle",
    "crescent",
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
                itemCount: sign.length,
                itemBuilder: (context, index) {
                  return FilterSignOptionTile(
                    list: list,
                    sign: sign[index],
                    text: signString[index],
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

