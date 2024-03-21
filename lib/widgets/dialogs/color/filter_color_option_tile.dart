import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'color_checkbox.dart';

class FilterColorOptionTile extends StatelessWidget {
  final String text;
  final FlagColor color;
  final List<FlagColor> list;

  const FilterColorOptionTile({
    super.key,
    required this.text,
    required this.color,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              translate("filters.colors.$text"),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          ColorCheckbox(
            color: color,
            list: list,
          )
        ],
      ),
    );
  }
}
