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
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand+" "+build.model;
      version = build.version.codename;
      identifier = build.id;

    }else if(Platform.isIOS){
      var build = await deviceInfoPlugin.iosInfo;
      name = build.name+" "+build.model;
      version = build.systemVersion;
      identifier = build.identifierForVendor!;

    }

  }on PlatformException {
    return DeviceInfo(name, version, identifier);

  }

  return DeviceInfo(name, version, identifier);






}