import 'package:yandex_summer_school/core/data/data_sources/obfuscation/obfuscation_abst.dart';
import 'package:yandex_summer_school/core/data/data_sources/url_shortener.dart';

class ShareProvider {
  ShareProvider({required Obfuscation obfuscation}) : _obfuscation = obfuscation;

  final Obfuscation _obfuscation;
  static const String _baseUrl = 'https://toodookeeper.web.app/';
  static const String _query = 'edit?data=';
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
}
