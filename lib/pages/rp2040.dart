import 'package:flutter/material.dart';
import 'package:pico_pin_configurator/components/scaffold_widget.dart';

class _RP2040ChipInternal extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 300,
    height: 300,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1
      )
    ),
  );
}

class _RP2040Pin extends StatelessWidget {
  bool vertical;
  int pinNum;

  _RP2040Pin(this.pinNum, this.vertical);

  @override
  Widget build(BuildContext context) => Container(
    child: Text("$pinNum"),
  );
}

enum _RP2040Side {
  EAST, // Pin 1 to 14
  SOUTH, // Pin 15 to 28
  WEST, // Pin 29 to 42
  NORTH // Pin 43 to 56
}

class _RP2040PinSide extends StatelessWidget {
  static const _PIN_IN_SIDE = 14;
  late List<_RP2040Pin> _pins;
  _RP2040Side side;

  _RP2040PinSide(this.side) {
    _pins = [];
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Text("AA"),
  );
}

class RP2040PinSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _RP2040ChipInternal()
              ],
            )
          ],
        ),
      ),
    ),
    bottomNavigationBar: getBottomNav(context),
    floatingActionButton: getFAB(context),
  );
}