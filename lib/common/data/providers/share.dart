import 'package:yandex_summer_school/common/data/data_sources/obfuscation/obfuscation.dart';
import 'package:yandex_summer_school/common/data/data_sources/url_shortener.dart';

class ShareProvider {
  ShareProvider({required Obfuscation obfuscation}) : _obfuscation = obfuscation;

  final Obfuscation _obfuscation;
  static const String _baseUrl = 'https://toodookeeper.web.app/';
  static const String _query = 'edit?data=';
  Future<String> getShareLink(String data) {
    final obfuscated = _obfuscation.encrypt(data);
    final link = _baseUrl + _query + Uri.encodeComponent(obfuscated);
    final short = UrlShortener.shortenUrl(link);
    return short;
  }

  String getSharedData(String query) {
    return _obfuscation.decrypt(Uri.decodeComponent(query));
  }
}
