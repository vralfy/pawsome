import 'package:flutter/material.dart';
import 'package:p6_base/config.dart';
import 'package:p6_ui/mixin/translates.dart';
import 'package:p6_ui/navigation/navigationbutton.dart';
import 'package:p6_ui/view.dart';

abstract class P6StatelessWidget extends StatelessWidget with Configuration, Translates {
  const P6StatelessWidget({Key? key}) : super(key: key);
}

abstract class P6StatefulWidget extends StatefulWidget with Configuration, Translates {
  const P6StatefulWidget({Key? key}) : super(key: key);
}

abstract class P6State<T extends P6StatefulWidget> extends State<T> with Configuration, Translates {
  void refresh() async {
    setState(() {});
  }

  String get title => '';
  List<NavigationButton>? get floatingActionButton => [
        NavigationButton.back(onPressed: () => Navigator.pop(context)),
        NavigationButton.refresh(onPressed: refresh),
      ];
  List<NavigationButton>? get bottomNavigation => [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    P6Config.context = context;
    return getViewContainer(context);
  }

  Widget getViewContainer(BuildContext context) {
    return View.main(
      context,
      getView(context),
      title: title,
      floatingActionButton: floatingActionButton,
      bottomNavigation: bottomNavigation,
    );
  }

  Widget getView(BuildContext context) {
    return const Text('');
  }
}
