import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_summer_school/common/data/data_sources/obfuscation/gzip.dart';

void main() {
  group('GZip obfuscation', () {
    late final GZipObfuscation obfuscation;
    setUpAll(() {
      obfuscation = GZipObfuscation();
    });
    test('English text', () {
      const text = 'Hello, World!';
      final encrypted = obfuscation.encrypt(text);
      expect(encrypted, isNot(text));
      final decrypted = obfuscation.decrypt(encrypted);
      expect(decrypted, text);
    });

    test('Russian text', () {
      const text = 'Привет, Мир!';
      final encrypted = obfuscation.encrypt(text);
      expect(encrypted, isNot(text));
      final decrypted = obfuscation.decrypt(encrypted);
      expect(decrypted, text);
    });

    test('Markdown text', () {
      const text = '## **Hello, World!**'
          ' - list1'
          ' - list2'
          ' > blockquote '
          '[Ссылка](https://yandex.ru)';
      final encrypted = obfuscation.encrypt(text);
      expect(encrypted, isNot(text));
      final decrypted = obfuscation.decrypt(encrypted);
      expect(decrypted, text);
    });
  });
}
