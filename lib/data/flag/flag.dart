import 'package:flagg/data/flag/enum_colors.dart';
import 'package:flagg/data/flag/enum_layout.dart';

class Flag {
  String name; // ISO alpha-3
  List<FlagColor> colors;
  FlagLayout layout;
  bool anySigns;

  Flag(
    this.name,
    this.colors,
    this.layout,
    this.anySigns,
  );

  bool contains(FlagColor color){
    for(var i in colors){
      if(i == color) {
        return true;
      }
    }
    return false;
  }

}
