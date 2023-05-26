import 'package:flutter/widgets.dart';
import 'package:p6_ui/headline/headline.dart';
import 'package:p6_ui/padding/padding.dart';
import 'package:p6_ui/view.dart';
import 'package:p6_ui/widget.dart';
import 'package:p6_ui/loading/loading_indicator.dart';

class Loading extends P6StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return View.centered(
      context,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          DefaultPadding(
            vertical: 20,
            child: Headline1(text: 'Loading'),
          ),
          LoadingIndicator(),
        ],
      ),
    );
  }
}
