import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../data/flag/enum_signs.dart';
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
      backgroundColor: Colors.blueGrey,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                translate("filters.signs.name"),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
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
