library ffwric_package_ui;

import 'package:flutter/material.dart';
import 'package:p6_ui/widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

// https://medium.flutterdevs.com/explore-slivers-in-flutter-d44073bffdf6
// https://stackoverflow.com/questions/53085311/sticky-headers-on-sliverlist
// https://itnext.io/create-a-header-footer-with-scrollable-body-view-in-flutter-5551087270de
// https://github.com/MayLau-CbL/sticky-footer-scrollview/blob/master/lib/sticky_footer_scrollview.dart
// https://www.youtube.com/watch?v=QVxd0K_74Pc
class ScrollContainer extends P6StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final Widget child;

  const ScrollContainer({
    Key? key,
    this.header,
    this.footer,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => build2(context);

  Widget build1(BuildContext context) {
    List<Widget> slivers = [];
    if (header != null) {
      slivers.add(SliverFixedExtentList(delegate: SliverChildListDelegate([header as Widget]), itemExtent: 100));
    }

    slivers.add(SliverFillRemaining(child: child));
    // slivers.add(SliverList(delegate: SliverChildListDelegate([Container(child: child)])));
    // slivers.add(SliverFixedExtentList(delegate: SliverChildListDelegate([child]), itemExtent: 300));

    if (footer != null) {
      slivers.add(SliverFixedExtentList(delegate: SliverChildListDelegate([footer as Widget]), itemExtent: 100));
    }

    return CustomScrollView(
      primary: true,
      slivers: slivers,
    );
  }

  Widget build2(BuildContext context) {
    List<Widget> slivers = [];

    if (header != null) {
      slivers.add(header as Widget);
    }

    if (footer != null) {
      slivers.add(footer as Widget);
    }

    return CustomScrollView(
      primary: true,
      slivers: [
        MultiSliver(
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: slivers,
              ),
            ),
            // child,
            // SliverFillRemaining(
            //   child: child,
            // ),
            // SliverClip(
            //   clipOverlap: true,
            //   child: SliverList(delegate: SliverChildListDelegate([child])),
            // ),
            SliverList(delegate: SliverChildListDelegate([child])),
          ],
        ),
      ],
    );
  }
}
