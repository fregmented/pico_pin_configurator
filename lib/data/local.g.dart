// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevInfo _$DevInfoFromJson(Map<String, dynamic> json) {
  return DevInfo(
    dev: json['dev'] as int,
    func: json['func'] as String,
  );
}

Map<String, dynamic> _$DevInfoToJson(DevInfo instance) => <String, dynamic>{
      'dev': instance.dev,
      'func': instance.func,
    };

PwmInfo _$PwmInfoFromJson(Map<String, dynamic> json) {
  return PwmInfo(
    dev: json['dev'] as int,
    channel: json['channel'] as String,
  );
}

Map<String, dynamic> _$PwmInfoToJson(PwmInfo instance) => <String, dynamic>{
      'dev': instance.dev,
      'channel': instance.channel,
    };

PinData _$PinDataFromJson(Map<String, dynamic> json) {
  return PinData(
    pin: json['pin'] as int,
    gpio: json['gpio'] as int?,
    spi: json['spi'] == null
        ? null
        : DevInfo.fromJson(json['spi'] as Map<String, dynamic>),
    uart: json['uart'] == null
        ? null
        : DevInfo.fromJson(json['uart'] as Map<String, dynamic>),
    i2c: json['i2c'] == null
        ? null
        : DevInfo.fromJson(json['i2c'] as Map<String, dynamic>),
    pwm: json['pwm'] == null
        ? null
        : PwmInfo.fromJson(json['pwm'] as Map<String, dynamic>),
    usb: json['usb'] as String?,
    pico_pin: json['pico_pin'] as int?,
    static: json['static'] as String?,
    description: json['description'] as String,
    available_functions: (json['available_functions'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  )..selected_function = json['selected_function'] as String?;
}

Map<String, dynamic> _$PinDataToJson(PinData instance) => <String, dynamic>{
      'pin': instance.pin,
      'gpio': instance.gpio,
      'spi': instance.spi,
      'uart': instance.uart,
      'i2c': instance.i2c,
      'pwm': instance.pwm,
      'usb': instance.usb,
      'pico_pin': instance.pico_pin,
      'static': instance.static,
      'description': instance.description,
      'available_functions': instance.available_functions,
      'selected_function': instance.selected_function,
    };
