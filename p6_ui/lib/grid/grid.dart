import 'package:flutter/widgets.dart';
import 'package:p6_ui/widget.dart';

abstract class ResponsibleWidget extends P6StatelessWidget {
  final int size;
  final int? size_xs;
  final int? size_sm;
  final int? size_lg;
  final int? size_xl;

  const ResponsibleWidget({
    Key? key,
    this.size = 1,
    this.size_xs,
    this.size_sm,
    this.size_lg,
    this.size_xl,
  }) : super(key: key);

  int get finalSize {
    int ret = size;
    ret = configuration.screen_xs ? (size_xs ?? size_sm ?? size) : ret;
    ret = configuration.screen_sm ? (size_sm ?? size_sm ?? size) : ret;

    ret = configuration.screen_xl ? (size_xl ?? size_lg ?? size) : ret;
    ret = configuration.screen_lg ? (size_lg ?? size_xl ?? size) : ret;
    return ret;
  }
}

class ResponsibleGrid extends ResponsibleWidget {
  final List<Widget>? children;
  final List<ResponsibleGridCell>? cells;
  final MainAxisAlignment? mainAxisAlignment;

  const ResponsibleGrid({
    Key? key,
    this.children,
    this.cells,
    this.mainAxisAlignment,
    super.size = 12,
    super.size_xs = 1,
    super.size_sm,
    super.size_lg,
    super.size_xl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> rows = [[]];
    int gridpos = 0;
    List<ResponsibleGridCell> finalCells = (cells ?? []);
    finalCells.addAll((children ?? []).map((e) => ResponsibleGridCell(e)).toList());
    finalCells.forEach((element) {
      rows.last.add(element);
      gridpos += element.finalSize;
      if (gridpos >= finalSize) {
        rows.add([]);
        gridpos = 0;
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
      children: rows
          .map((e) => Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
                children: e,
              ))
          .toList(),
    );
  }
}

class ResponsibleGridCell extends ResponsibleWidget {
  final Widget child;

  const ResponsibleGridCell(
    this.child, {
    Key? key,
    super.size = 1,
    super.size_xs = 12,
    super.size_sm,
    super.size_lg,
    super.size_xl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
