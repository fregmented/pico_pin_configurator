import 'package:flutter/material.dart';
import 'package:pico_pin_configurator/constants/routes.dart';
import 'package:provider/provider.dart';
import 'package:pico_pin_configurator/providers/pin_info_provider.dart';


Widget getBottomNav(BuildContext context) => BottomNavigationBar(
  items: routes.map((e) => BottomNavigationBarItem(
      icon: Icon(e.icon),
      label: e.title
  )).toList(),
  currentIndex: routes.getRouteIndex(ModalRoute.of(context)?.settings.name),
  onTap: (value) {
    Navigator.pushNamed(context, routes[value].route);
    // debugPrint("ROUTE: ${ModalRoute.of(context)?.settings.name}");
  },
);

Widget _getPinInfo(BuildContext context) => Container(
  child: Text('${Provider.of<PinInfoProvider>(context).count}'),
);

Widget getFAB(BuildContext context) => FloatingActionButton(
  onPressed: () {
    showModalBottomSheet(
        context: context,
        builder: (context) => _getPinInfo(context),
        isScrollControlled: true);
  },
  child: Icon(Icons.info),
);