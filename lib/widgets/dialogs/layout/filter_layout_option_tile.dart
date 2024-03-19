import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/flag/enum_layout.dart';
import 'layout_checkbox.dart';

class FilterLayoutOptionTile extends StatelessWidget {
  final String text;
  final FlagLayout layout;
  final List<FlagLayout> list;

  const FilterLayoutOptionTile({
    super.key,
    required this.text,
    required this.layout,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        LayoutCheckbox(
          layout: layout,
          list: list,
        )
      ],
    );
  }
}
