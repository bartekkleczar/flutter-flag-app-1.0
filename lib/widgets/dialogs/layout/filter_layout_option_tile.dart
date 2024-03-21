import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate("filters.layouts.$text"),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          LayoutCheckbox(
            layout: layout,
            list: list,
          )
        ],
      ),
    );
  }
}
