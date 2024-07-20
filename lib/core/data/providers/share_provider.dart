import 'package:flutter/services.dart';
import 'package:yandex_summer_school/core/data/data_sources/obfuscation/obfuscation_abst.dart';
import 'package:yandex_summer_school/core/data/data_sources/url_shortener.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';

class ShareProvider {
  ShareProvider({required Obfuscation obfuscation})
      : _obfuscation = obfuscation;

  final Obfuscation _obfuscation;

  static const _channelName = 'com.glootea.toodookeeper/todo';
  static const _methodName = 'share';
  static const _baseUrl = 'https://toodookeeper.web.app/';
  static const _query = 'edit?data=';

  Future<String> getShareLink(String data, {bool tryShort = false}) async {
    final obfuscated = _obfuscation.encrypt(data);
    var link = _baseUrl + _query + Uri.encodeComponent(obfuscated);
    if (tryShort) {
      link = await UrlShortener.shortenUrl(link);
    }
    return link;
  }

  String getSharedData(String query) {
    return _obfuscation.decrypt(Uri.decodeComponent(query));
  }

  Future<void> share(String message) async {
    const platform = MethodChannel(_channelName);
    await platform.invokeMethod<void>(_methodName, {'text': message});
  }

  Future<void> shareToDo(ToDo toDo, String deviceID) async {
    final text = toDo.dataToExport(deviceID);
    final exportText = await getShareLink(text, tryShort: true);
    await share(exportText);
  }
}
