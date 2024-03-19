import 'package:flagg/data/flag/flag.dart';
import 'package:flutter/material.dart';

class FlagTile extends StatelessWidget {
  final Flag flag;

  const FlagTile({
    super.key,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            flag.getImagePath(),
            width: 100,
            height: 100,
          ),
          Text(
            flag.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          )
        ],
      ),
    );
  }
}
