
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pico_pin_configurator/pages/pico.dart';
import 'package:pico_pin_configurator/pages/rp2040.dart';
import 'package:pico_pin_configurator/pages/table.dart';

class Route {

  Route(this._title, this.icon, this.route, this.routeTarget);
  final String _title;
  String get title => _title.tr();
  final IconData icon;
  final String route;
  final Widget routeTarget;
}

final List<Route> routes = [
  Route('nav.table', Icons.table_chart, '/table', RP2040TableSelector()),
  Route('nav.rp2040', Icons.memory, '/rp2040', RP2040PinSelector()),
  Route('nav.pico', Icons.developer_board, '/pico', PicoPinSelector())
];

extension ListIndex on List<Route> {
  int getRouteIndex(String? route) => routes.indexOf(routes.where((element) => element.route == route).first);
}

Map<String, WidgetBuilder> getRoutesMap() {
  Map<String, WidgetBuilder> map = Map();
  routes.forEach((element) {
    map[element.route] = (_) => element.routeTarget;
  });
  return map;
}