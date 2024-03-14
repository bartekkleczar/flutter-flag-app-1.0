import 'enum_colors.dart';
import 'enum_layout.dart';

class Flag {
  final String name; // ISO alpha-3
  final List<FlagColor> colors;
  final FlagLayout layout;
  final bool anySigns;

  Flag(
    this.name,
    this.colors,
    this.layout,
    this.anySigns,
  );

}
