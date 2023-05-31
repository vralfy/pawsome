import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_base/objects/config/host.dart';
import 'package:p6_ui/headline/headline.dart';
import 'package:p6_ui/host/online_indiator.dart';
import 'package:p6_ui/padding/padding.dart';
import 'package:p6_ui/widget.dart';

class HostCard extends P6StatelessWidget {
  final ConfigHost host;
  final double iconSize;

  const HostCard({super.key, required this.host, this.iconSize = 50});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: configuration.colorBackground,
      child: InkWell(
        child: DefaultPadding(
          child: Row(
            children: [
              DefaultPadding(
                child: Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: configuration.colorInfo),
                  padding: EdgeInsets.all(iconSize * 0.2),
                  child: SizedBox(
                    width: iconSize * 0.6,
                    height: iconSize * 0.6,
                    child: FaIcon(
                      FontAwesomeIcons.computer,
                      color: configuration.colorWhite,
                      size: iconSize * 0.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Headline1(text: host.name),
                    Text(host.description),
                    Text(host.address),
                    Text(host.tag.join(', ')),
                  ],
                ),
              ),
              DefaultPadding(child: HostOnlineIndicator(config: host.check)),
            ],
          ),
        ),
      ),
    );
  }
}
