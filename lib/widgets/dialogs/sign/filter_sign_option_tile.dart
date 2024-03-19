import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/flag/enum_layout.dart';
import '../../../data/flag/enum_signs.dart';
import 'sign_checkbox.dart';

class FilterSignOptionTile extends StatelessWidget {
  final String text;
  final FlagSign sign;
  final List<FlagSign> list;

  const FilterSignOptionTile({
    super.key,
    required this.text,
    required this.sign,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        SignCheckbox(
          sign: sign,
          list: list,
        )
      ],
    );
  }
}
