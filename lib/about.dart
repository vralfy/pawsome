import 'package:flutter/widgets.dart';
import 'package:p6_ui/headline/headline.dart';
import 'package:p6_ui/view.dart';
import 'package:p6_ui/widget.dart';

class About extends P6StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return View.centered(
        context,
        Table(
          children: [
            const TableRow(children: [
              Headline1(text: 'In progress'),
              Headline1(text: 'In progress'),
            ]),
            TableRow(children: [
              Text("Config directories:"),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('Documents: '),
                      Text(configuration.directory_documents?.path ?? 'unknown'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Temp: '),
                      Text(configuration.directory_temporary?.path ?? 'unknown'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Download: '),
                      Text(configuration.directory_download?.path ?? 'unknown'),
                    ],
                  ),
                ],
              )
            ])
          ],
        ));
  }
}
