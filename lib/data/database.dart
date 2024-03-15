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

  void createInitialData(){
    flags = [
      Flag('AFC', [_red, _black, _green, _white], _vertical, true),
      Flag('ALB', [_red, _black], _middle, true),
      Flag('DZA', [_red, _green, _white], _vertical, true),
    ];
  }

  void loadData(){
    flags = _myBox.get('FLAGS');
  }

  List<Flag> filter(Flag data, List<Flag> allFlags){
    List<Flag> filtered = [];
    for (var flag in allFlags){
      bool contains = true;
      for(var color in data.colors){
        if (!flag.contains(color)) {
          contains = false;
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