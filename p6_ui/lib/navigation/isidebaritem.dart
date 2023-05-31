import 'package:flutter/material.dart';
import 'package:p6_ui/widget.dart';

abstract class ISidebarItem extends P6StatelessWidget {
  final String title;
  final IconData? icon;
  final bool enabled;

  const ISidebarItem({
    super.key,
    required this.title,
    this.icon,
    this.enabled = true,
  });
}
