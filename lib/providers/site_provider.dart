import 'package:flutter/widgets.dart';
import 'package:pico_pin_configurator/pages/pico.dart';
import 'package:pico_pin_configurator/pages/rp2040.dart';
import 'package:pico_pin_configurator/pages/table.dart';

abstract class Peripheral {
  late int dev;

  Peripheral(this.dev);

  bool complete();
}

enum SPI_MODE {
  TRANSMIT,
  RECEIVE,
  TRANCEIVE,
  ERROR
}

class SpiDevice extends Peripheral {
  int sckPin = -1;
  int txPin = -1;
  int rxPin = -1;
  List<int> csPins = [];

  set csPin(int pin) {
    if(!csPins.contains(pin)) {
      csPins.add(pin);
    }
  }

  SpiDevice(int dev): super(dev);

  bool complete() => dev < 2 &&
      [4,8,13,17,29,34,38].contains(sckPin) &&
      (
          [5,9,14,18,30,35,39].contains(txPin) ||
              [2,6,11,15,27,31,36,40].contains(rxPin)
      ) &&
      csPins.length > 0 &&
      [3,7,12,16,28,32,37,41].any((element) => csPins.contains(element));

  SPI_MODE getMode() {
    if([5,9,14,18,30,35,39].contains(txPin) && ![2,6,11,15,27,31,36,40].contains(rxPin)) {
      return SPI_MODE.TRANSMIT;
    } else if(![5,9,14,18,30,35,39].contains(txPin) && [2,6,11,15,27,31,36,40].contains(rxPin)) {
      return SPI_MODE.RECEIVE;
    } else if([5,9,14,18,30,35,39].contains(txPin) && [2,6,11,15,27,31,36,40].contains(rxPin)) {
      return SPI_MODE.TRANCEIVE;
    }
    return SPI_MODE.ERROR;
  }
}

class I2cDevice extends Peripheral{
  int sclPin = -1;
  int sdaPin = -1;

  I2cDevice(int dev): super(dev);

  @override
  bool complete() => dev < 2 &&
      [3,5,7,9,12,14,16,18,28,30,32,35,37,39,41].contains(sclPin) &&
      [2,4,6,8,11,13,15,17,27,29,31,34,36,38,40].contains(sdaPin);
}

enum UART_MODE {
  TRASMIT,
  TRANSMIT_FLOW,
  RECEIVE,
  RECEIVE_FLOW,
  TRANCEIVE,
  TRANCEIVE_FLOW,
  ERROR
}

class UartDevice extends Peripheral {
  int txdPin = -1;
  int rxdPin = -1;
  int ctsPin = -1;
  int rtsPin = -1;

  UartDevice(int dev): super(dev);

  @override
  bool complete() => dev < 2 &&
      (
          [2,6,11,15,27,31,36,40].contains(txdPin) ||
              [3,7,12,16,28,32,37,41].contains(rxdPin)
      );

  UART_MODE getMode() {
    if([2,6,11,15,27,31,36,40].contains(txdPin) &&
        ![3,7,12,16,28,32,37,41].contains(rxdPin)) {
      if(![4,8,13,17,29,34,38].contains(ctsPin) &&
          ![5,9,14,18,30,35,39].contains(rtsPin)) {
        return UART_MODE.TRASMIT;
      } else {
        return UART_MODE.TRANSMIT_FLOW;
      }
    } else if(![2,6,11,15,27,31,36,40].contains(txdPin) &&
        [3,7,12,16,28,32,37,41].contains(rxdPin)) {
      if(![4,8,13,17,29,34,38].contains(ctsPin) &&
          ![5,9,14,18,30,35,39].contains(rtsPin)) {
        return UART_MODE.RECEIVE;
      } else {
        return UART_MODE.RECEIVE_FLOW;
      }
    } else if ([2,6,11,15,27,31,36,40].contains(txdPin) &&
        [3,7,12,16,28,32,37,41].contains(rxdPin)) {
      if(![4,8,13,17,29,34,38].contains(ctsPin) &&
          ![5,9,14,18,30,35,39].contains(rtsPin)) {
        return UART_MODE.TRANCEIVE;
      } else {
        return UART_MODE.TRANCEIVE_FLOW;
      }
    }
    return UART_MODE.ERROR;
  }
}

class PwmDevice extends Peripheral {
  String channel;
  int pin = -1;

  PwmDevice(int dev, this.channel): super(dev);

  @override
  bool complete() => true;
}

class AdcDevice extends Peripheral {
  int pin;

  AdcDevice(int dev, this.pin): super(dev);

  @override
  bool complete() => true;
}

class SiteProvider extends ChangeNotifier {
  static SiteProvider? _instance;

  SiteProvider._internal();

  factory SiteProvider.getInstance() {
    _instance ??= SiteProvider._internal();
    return _instance!;
  }
}