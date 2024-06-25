import 'package:dio/dio.dart';
import 'package:yandex_summer_school/main.dart';

class UrlShortener {
  static Future<String> shortenUrl(String url) async {
    try {
      final dio = Dio();
      final response = await dio.get<Map<String, dynamic>>(
        'https://ulvis.net/API/write/get',
        queryParameters: {'url': url},
      );
      // ignore: avoid_dynamic_calls
      final short = response.data?['data']['url'] as String;
      return short;
    } catch (e) {
      logger.e('Failed to shorten url: $url, error: $e');
      return url;
    }
  }
}
