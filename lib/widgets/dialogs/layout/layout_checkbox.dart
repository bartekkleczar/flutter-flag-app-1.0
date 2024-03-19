import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/material.dart';

import '../../../data/flag/enum_layout.dart';

class LayoutCheckbox extends StatefulWidget {
  final FlagLayout layout;
  final List<FlagLayout> list;

  LayoutCheckbox({
    Key? key,
    required this.list,
    required this.layout,
  }) : super(key: key);

  @override
  _LayoutCheckboxState createState() => _LayoutCheckboxState();
}

class _LayoutCheckboxState extends State<LayoutCheckbox> {
  bool value = false;

  @override
  void initState() {

    for(var i in widget.list){
      if(i == widget.layout){
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
            widget.list.add(widget.layout);
            //print("${widget.color} added: ${widget.list.toString()}");
          } else {
            widget.list.remove(widget.layout);
            //print("${widget.color} removed");
          }
        });
      },
    );
  }
}