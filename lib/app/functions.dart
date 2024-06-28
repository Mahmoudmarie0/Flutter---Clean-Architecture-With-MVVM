import 'dart:io';

import 'package:clean_architecture_with_mvvm/domain/model/model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = 'Unknown';
  String version = 'Unknown';
  String identifier = 'Unknown';

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try{
    if(Platform.isAndroid){

    }else if(Platform.isIOS){

    }

  }on PlatformException {
    return DeviceInfo(name, version, identifier);

  }

  return DeviceInfo(name, version, identifier);






}