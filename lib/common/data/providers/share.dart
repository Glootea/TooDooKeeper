import 'package:yandex_summer_school/common/data/data_sources/obfuscation/obfuscation.dart';

class ShareProvider {
  ShareProvider({required Obfuscation obfuscation}) : _obfuscation = obfuscation;

  final Obfuscation _obfuscation;
  static const String _baseUrl = 'https://toodookeeper.web.app/';
  static const String _query = 'edit?data=';
  String getShareLink(String data) {
    final obfuscated = _obfuscation.encrypt(data);
    return _baseUrl + _query + obfuscated;
  }

  String getSharedData(String link) {
    final obfuscated = link.split(_query).last;
    return _obfuscation.decrypt(obfuscated);
  }
}
