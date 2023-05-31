import 'package:flutter/widgets.dart';
import 'package:p6_ui/container/scrollcontainer.dart';
import 'package:p6_ui/headline/headline.dart';
import 'package:p6_ui/view.dart';
import 'package:p6_ui/widget.dart';

class About extends P6StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return View.centered(
      context,
      ScrollContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Headline1(text: 'System'),
            Table(
              children: [
                TableRow(children: [
                  const Text("Config directories:"),
                  const Text('Temp: '),
                  Text(configuration.directory_temporary?.path ?? 'unknown'),
                ]),
                TableRow(children: [
                  const Text(""),
                  const Text('External: '),
                  Text(configuration.directory_external?.path ?? 'unknown'),
                ]),
                TableRow(children: [
                  const Text(""),
                  const Text('Libs: '),
                  Text(configuration.directory_library?.path ?? 'unknown'),
                ]),
                TableRow(children: [
                  const Text(""),
                  const Text('Support: '),
                  Text(configuration.directory_support?.path ?? 'unknown'),
                ]),
                TableRow(children: [
                  const Text(""),
                  const Text('Documents: '),
                  Text(configuration.directory_documents?.path ?? 'unknown'),
                ]),
                TableRow(children: [
                  const Text(""),
                  const Text('Download: '),
                  Text(configuration.directory_download?.path ?? 'unknown'),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
