import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flagg/data/flag/enum_layout.dart';
import 'package:flagg/data/flag/enum_signs.dart';

class Flag {
  String name; // ISO alpha-3
  List<FlagColor> colors;
  List<FlagLayout> layout;
  List<FlagSign> signs;

  Flag(
    this.name,
    this.colors,
    this.layout,
    this.signs,
  );

  String getImagePath(){
    return "images/$name.webp";
  }

  bool contains(FlagColor color){
    for(var i in colors){
      if(i == color) {
        return true;
      }
    }
    return false;
  }

}
