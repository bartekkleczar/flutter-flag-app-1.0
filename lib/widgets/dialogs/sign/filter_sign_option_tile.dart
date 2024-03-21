import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate("filters.signs.$text"),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SignCheckbox(
            sign: sign,
            list: list,
          )
        ],
      ),
    );
  }
}
