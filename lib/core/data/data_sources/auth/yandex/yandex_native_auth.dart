import 'package:flutter/services.dart';

class YandexNativeAuth {
  static const _channelName = 'com.glootea.toodookeeper/todo';
  static const _methodName = 'yandexLogin';

  static Future<Map<Object?, Object?>?> auth() async {
    const platform = MethodChannel(_channelName);
    final data =
        await platform.invokeMethod<Map<Object?, Object?>>(_methodName);
    return data;
  }
}
