import 'package:p6_base/config/from_context.dart';
import 'package:p6_base/config/from_json.dart';

mixin ConfigGrid on ConfigFromJSON, ConfigFromContext {
  int get breakpointWidthXS => int.parse(getByPath(str: 'grid, screen, extrasmall', defaultValue: '300', config: jsonFiles['grid']?.content));
  int get breakpointWidthSM => int.parse(getByPath(str: 'grid, screen, small', defaultValue: '500', config: jsonFiles['grid']?.content));
  int get breakpointWidthLG => int.parse(getByPath(str: 'grid, screen, large', defaultValue: '1000', config: jsonFiles['grid']?.content));
  int get breakpointWidthXL => int.parse(getByPath(str: 'grid, screen, large', defaultValue: '1200', config: jsonFiles['grid']?.content));

  bool get screenXS => (screenWidth <= breakpointWidthXS);
  bool get screenSM => (screenWidth > breakpointWidthXS) && (screenWidth <= breakpointWidthSM);
  bool get screenMD => (screenWidth > breakpointWidthSM) && (screenWidth <= breakpointWidthLG);
  bool get screenLG => (screenWidth > breakpointWidthLG) && (screenWidth <= breakpointWidthXL);
  bool get screenXL => (screenWidth > breakpointWidthXL);
}
