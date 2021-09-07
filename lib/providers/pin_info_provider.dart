import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pico_pin_configurator/data/local.dart';

class PinInfoProvider extends ChangeNotifier {
  static PinInfoProvider? _instance;
  List<PinData>? _datas;

  bool hasData = false;
  int get count => _datas?.length??0;
  PinData? data(int index) => _datas?.elementAt(index);
  PinData? pinData(int pin) => _datas?.where((element) => element.pin == pin).first;
  PinData? picoPinData(int picoPin) => _datas?.where((element) => (element.pico_pin??-1) == picoPin).first;


  PinInfoProvider._internal() {
    rootBundle.loadString('assets/json/rp2040_pin_data.json').then((value) {
      _datas = (jsonDecode(value) as List<dynamic>).map<PinData>((e) => PinData.fromJson(e)).toList();
      _datas!.sort((e1, e2) => e1.pin - e2.pin);
      hasData = value.length > 0;
      notifyListeners();
    });
    // LocalAssets(_dio, baseUrl: _baseUrl).getPinDatas().then((value) {
    //   debugPrint("PinInfoProvider::DATA");
    //   _datas = value;
    //   _datas!.sort((e1, e2) => e1.pin - e2.pin);
    //   hasData = value.length > 0;
    //   notifyListeners();
    // });
  }

  factory PinInfoProvider.getInstance() {
    _instance ??= PinInfoProvider._internal();
    return _instance!;
  }
}