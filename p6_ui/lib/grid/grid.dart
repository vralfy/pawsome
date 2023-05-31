import 'package:flutter/widgets.dart';
import 'package:p6_ui/widget.dart';

abstract class ResponsibleWidget extends P6StatelessWidget {
  final int size;
  final int? sizeXS;
  final int? sizeSM;
  final int? sizeLG;
  final int? sizeXL;

  const ResponsibleWidget({
    Key? key,
    this.size = 1,
    this.sizeXS,
    this.sizeSM,
    this.sizeLG,
    this.sizeXL,
  }) : super(key: key);

  int get finalSize {
    int ret = size;
    ret = configuration.screenXS ? (sizeXS ?? sizeSM ?? size) : ret;
    ret = configuration.screenSM ? (sizeSM ?? sizeSM ?? size) : ret;

    ret = configuration.screenXL ? (sizeXL ?? sizeLG ?? size) : ret;
    ret = configuration.screenLG ? (sizeLG ?? sizeXL ?? size) : ret;
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
    super.sizeXS,
    super.sizeSM,
    super.sizeLG,
    super.sizeXL,
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
    super.sizeXS,
    super.sizeSM,
    super.sizeLG,
    super.sizeXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
