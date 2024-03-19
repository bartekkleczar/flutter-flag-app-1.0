import 'package:flagg/data/flag/enum_signs.dart';
import 'package:hive/hive.dart';
import 'flag/flag.dart';
import 'flag/enum_colors.dart';
import 'flag/enum_layout.dart';

class FlaggDatabase{

  List flags = [];
  final _myBox = Hive.box('mybox');

  final FlagColor  _red = FlagColor.red;
  final FlagColor _green = FlagColor.green;
  final FlagColor _blue = FlagColor.blue;
  final FlagColor _black = FlagColor.black;
  final FlagColor _white = FlagColor.white;
  final FlagColor _yellow = FlagColor.yellow;
  final FlagColor _orange = FlagColor.orange;

  final FlagLayout _vertical = FlagLayout.vertical;
  final FlagLayout _horizontal = FlagLayout.horizontal;
  final FlagLayout _middle = FlagLayout.middle;
  final FlagLayout _diagonal = FlagLayout.diagonal;

  final FlagSign _none = FlagSign.none;
  final FlagSign _other = FlagSign.other;
  final FlagSign _star = FlagSign.star;
  final FlagSign _circle = FlagSign.circle;
  final FlagSign _bird = FlagSign.bird;
  final FlagSign _crescent = FlagSign.crescent;

  void createInitialData(){
    flags = [
      Flag('AFG', [_red, _black, _green, _white], [_vertical], [_other]),
      Flag('ALB', [_red, _black], [_middle], [_bird]),
      Flag('DZA', [_red, _green, _white], [_vertical], [_crescent, _star]),
    ];
  }

  void loadData(){
    flags = _myBox.get('FLAGS');
  }

  List<Flag> filterByColor(Flag data, List<Flag> allFlags){
    List<Flag> filtered = [];
    for (var flag in allFlags){
      bool contains = true;
      for(var color in data.colors){
        if (!flag.colors.contains(color)) {
          contains = false;
          contains;
          break;
        }
      }
      if(contains) filtered.add(flag);
    }
    return filtered;
  }

  List<Flag> filterByLayout(Flag data, List<Flag> allFlags){
    List<Flag> filtered = [];
    for (var flag in allFlags){
      bool contains = true;
      for(var layout in data.layout){
        if (!flag.layout.contains(layout)) {
          contains = false;
          contains;
          break;
        }
      }
      if(contains) filtered.add(flag);
    }
    return filtered;
  }

  List<Flag> filterBySign(Flag data, List<Flag> allFlags){
    List<Flag> filtered = [];
    for (var flag in allFlags){
      bool contains = true;
      for(var sign in data.signs){
        if (!flag.signs.contains(sign)) {
          contains = false;
          contains;
          break;
        }
      }
      if(contains) filtered.add(flag);
    }
    return filtered;
  }

  void updateDataBase(){
    _myBox.put('FLAGS', flags);
  }

  List<Flag> getFlags(){
    List<Flag> output = [];

    for(var i in flags){
      output.add(i);
    }

    return output;
  }
}