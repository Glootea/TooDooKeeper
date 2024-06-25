import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_summer_school/common/data/data_sources/obfuscation/gzip.dart';
import 'package:yandex_summer_school/common/data/providers/share.dart';

void main() {
  group('Share text', () {
    late final ShareProvider shareProvider;
    setUpAll(() {
      shareProvider = ShareProvider(obfuscation: GZipObfuscation());
    });
    test('English text', () {
      const text = 'Hello, World!';
      final encrypted = shareProvider.getShareLink(text);
      final decrypted = shareProvider.getSharedData(encrypted);
      expect(decrypted, text);
    });

    test('Russian text', () {
      const text = 'Привет, Мир!';
      final encrypted = shareProvider.getShareLink(text);
      final decrypted = shareProvider.getSharedData(encrypted);
      expect(decrypted, text);
    });

    test('Markdown text', () {
      const text = '## **Hello, World!**'
          ' - list1'
          ' - list2'
          ' > blockquote '
          '[Ссылка](https://yandex.ru)';
      final encrypted = shareProvider.getShareLink(text);
      final decrypted = shareProvider.getSharedData(encrypted);
      expect(decrypted, text);
    });
  });
}
