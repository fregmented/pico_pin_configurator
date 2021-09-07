import 'package:flutter/material.dart';
import 'package:pico_pin_configurator/components/scaffold_widget.dart';

class PicoPinSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      child: Text("PICO"),
    ),
    bottomNavigationBar: getBottomNav(context),
    floatingActionButton: getFAB(context),
  );
}