import 'package:flutter/material.dart';

mixin ConfigNavigation {
  List<Widget> Function() navbarItems = () {
    return [] as List<Widget>;
  };
}
