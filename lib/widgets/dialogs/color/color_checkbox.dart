import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flutter/material.dart';

class ColorCheckbox extends StatefulWidget {
  final FlagColor color;
  final List<FlagColor> list;

  ColorCheckbox({
    Key? key,
    required this.list,
    required this.color,
  }) : super(key: key);

  @override
  _ColorCheckboxState createState() => _ColorCheckboxState();
}

class _ColorCheckboxState extends State<ColorCheckbox> {
  bool value = false;

  @override
  void initState() {

    for(var i in widget.list){
      if(i == widget.color){
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
            widget.list.add(widget.color);
            //print("${widget.color} added: ${widget.list.toString()}");
          } else {
            widget.list.remove(widget.color);
            //print("${widget.color} removed");
          }
        });
      },
    );
  }
}