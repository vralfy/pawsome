import 'package:flutter/material.dart';
import 'package:p6_ui/view.dart';
import 'package:p6_ui/widget.dart';
import 'package:p6_ui/host/card.dart';
import 'package:p6_ui/grid/grid.dart';

class Hosts extends P6StatefulWidget {
  const Hosts({super.key});

  @override
  State<StatefulWidget> createState() => HostState();
}

class HostState extends P6State<Hosts> {
  Widget build(BuildContext context) {
    return View.main(
      context,
      ResponsibleGrid(
        children: configuration.remoteHosts.map((e) => HostCard(host: e)).toList(),
      ),
    );
  }
}
