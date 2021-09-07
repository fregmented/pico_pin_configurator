import 'dart:html';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local.g.dart';
@JsonSerializable()
class DevInfo {
  int dev;
  String func;

  DevInfo({this.dev = 0, this.func = "NONE"});

  factory DevInfo.fromJson(Map<String, dynamic> json) => _$DevInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DevInfoToJson(this);
}

@JsonSerializable()
class PwmInfo {
  int dev;
  String channel;

  PwmInfo({this.dev = 0, this.channel = "NONE"});

  factory PwmInfo.fromJson(Map<String, dynamic> json) => _$PwmInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PwmInfoToJson(this);
}

@JsonSerializable()
class PinData extends ChangeNotifier{
  int pin;
  int? gpio;
  DevInfo? spi;
  DevInfo? uart;
  DevInfo? i2c;
  PwmInfo? pwm;
  String? usb;
  int? pico_pin;
  String? static;
  String description;
  List<String>? available_functions;
  String? _selected_function = 'gpio';

  String? get selected_function => _selected_function;
  set selected_function(String? newVal) {
    _selected_function = newVal;
    notifyListeners();
  }

  PinData({this.pin = 0, this.gpio, this.spi, this.uart, this.i2c, this.pwm,
    this.usb, this.pico_pin, this.static, this.description = "",
    this.available_functions});

  factory PinData.fromJson(Map<String, dynamic> json) => _$PinDataFromJson(json);
  Map<String, dynamic> toJson() => _$PinDataToJson(this);
}