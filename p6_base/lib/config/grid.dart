import 'package:p6_base/config/from_context.dart';
import 'package:p6_base/config/from_json.dart';

mixin ConfigGrid on ConfigFromJSON, ConfigFromContext {
  int get breakpoint_width_xs => int.parse(getByPath(str: 'grid, screen, extrasmall', defaultValue: '300', config: jsonFiles['grid']?.content));
  int get breakpoint_width_sm => int.parse(getByPath(str: 'grid, screen, small', defaultValue: '500', config: jsonFiles['grid']?.content));
  int get breakpoint_width_lg => int.parse(getByPath(str: 'grid, screen, large', defaultValue: '1000', config: jsonFiles['grid']?.content));
  int get breakpoint_width_xl => int.parse(getByPath(str: 'grid, screen, large', defaultValue: '1200', config: jsonFiles['grid']?.content));

  bool get screen_xs => (screen_width <= breakpoint_width_xs);
  bool get screen_sm => (screen_width > breakpoint_width_xs) && (screen_width <= breakpoint_width_sm);
  bool get screen_nn => (screen_width > breakpoint_width_sm) && (screen_width <= breakpoint_width_lg);
  bool get screen_lg => (screen_width > breakpoint_width_lg) && (screen_width <= breakpoint_width_xl);
  bool get screen_xl => (screen_width > breakpoint_width_xl);
}
