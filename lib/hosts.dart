import 'package:flutter/material.dart';
import 'package:p6_ui/padding/padding.dart';
import 'package:p6_ui/view.dart';
import 'package:p6_ui/widget.dart';
import 'package:p6_ui/container/scrollcontainer.dart';
import 'package:p6_ui/host/card.dart';
import 'package:p6_ui/grid/grid.dart';

class Hosts extends P6StatefulWidget {
  const Hosts({super.key});

  @override
  State<StatefulWidget> createState() => HostState();
}

class HostState extends P6State<Hosts> {
  @override
  Widget build(BuildContext context) {
    return View.main(
      context,
      ScrollContainer(
        child: ResponsibleGrid(
          size: 2,
          cells: configuration.remoteHosts
              .map(
                (e) => ResponsibleGridCell(
                  Expanded(
                    child: DefaultPadding(
                      verticalMultiplier: 10,
                      child: HostCard(host: e),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
