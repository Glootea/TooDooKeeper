import 'package:dio/dio.dart';
import 'package:yandex_summer_school/main.dart';

class UrlShortener {
  static Future<String> shortenUrl(String url) async {
    try {
      final dio = Dio();
      final response = await dio.post<Map<String, dynamic>>(
        'https://spoo.me',
        queryParameters: {'url': url},
        options: Options(headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'}),
      );
      // ignore: avoid_dynamic_calls
      final short = response.data?['short_url'] as String;
      return short;
    } catch (e) {
      logger.e('Failed to shorten url: $url, error: $e');
      return url;
    }
  }
}
