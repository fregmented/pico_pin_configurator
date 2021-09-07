import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:pico_pin_configurator/constants/routes.dart';
import 'package:pico_pin_configurator/pages/pico.dart';
import 'package:pico_pin_configurator/pages/rp2040.dart';
import 'package:pico_pin_configurator/pages/table.dart';
import 'package:pico_pin_configurator/providers/pin_info_provider.dart';
import 'package:pico_pin_configurator/providers/site_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PinInfoProvider.getInstance()),
      ChangeNotifierProvider.value(value: SiteProvider.getInstance()),
    ],
    child: EasyLocalization(
      supportedLocales: [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: App(),
    ),
  )
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'RP2040 pin configurator',
    localizationsDelegates: context.localizationDelegates,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent
    ),
    routes: getRoutesMap(),
    initialRoute: routes[0].route,
  );
}