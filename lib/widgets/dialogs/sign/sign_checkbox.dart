import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/material.dart';

import '../../../data/flag/enum_layout.dart';
import '../../../data/flag/enum_signs.dart';

class SignCheckbox extends StatefulWidget {
  final FlagSign sign;
  final List<FlagSign> list;

  SignCheckbox({
    Key? key,
    required this.list,
    required this.sign,
  }) : super(key: key);

  @override
  _SignCheckboxState createState() => _SignCheckboxState();
}

class _SignCheckboxState extends State<SignCheckbox> {
  bool value = false;

  @override
  void initState() {

    for(var i in widget.list){
      if(i == widget.sign){
        value = true;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
          if (newValue) {
            widget.list.add(widget.sign);
            //print("${widget.color} added: ${widget.list.toString()}");
          } else {
            widget.list.remove(widget.sign);
            //print("${widget.color} removed");
          }
        });
      },
    );
  }
}