import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_summer_school/common/data/data_sources/obfuscation/gzip.dart';
import 'package:yandex_summer_school/common/data/providers/share.dart';

void main() {
  group('Share text', () {
    late final ShareProvider shareProvider;
    setUpAll(() {
      shareProvider = ShareProvider(obfuscation: GZipObfuscation());
    });
    test('English text', () async {
      const text = 'Hello, World!';
      final encrypted = await shareProvider.getShareLink(text);
      final decrypted = shareProvider.getSharedData(encrypted);
      expect(decrypted, text);
    });

    test('Russian text', () async {
      const text = 'Привет, Мир!';
      final encrypted = await shareProvider.getShareLink(text);
      final decrypted = shareProvider.getSharedData(encrypted);
      expect(decrypted, text);
    });

    test('Markdown text', () async {
      const text = '## **Hello, World!**'
          ' - list1'
          ' - list2'
          ' > blockquote '
          '[Ссылка](https://yandex.ru)';
      final encrypted = await shareProvider.getShareLink(text);
      final decrypted = shareProvider.getSharedData(encrypted);
      expect(decrypted, text);
    });
  });
}
