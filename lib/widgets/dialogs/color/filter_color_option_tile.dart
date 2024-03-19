import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Text(text),
        ColorCheckbox(
            color: color,
            list: list,
        )
      ],
    );
  }
}
