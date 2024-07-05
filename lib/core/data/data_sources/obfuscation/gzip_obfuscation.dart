import 'dart:convert';
import 'dart:io';

import 'package:yandex_summer_school/core/data/data_sources/obfuscation/obfuscation_abst.dart';

class GZipObfuscation extends Obfuscation {
  final codec = GZipCodec();
  @override
  String encrypt(String data) {
    return base64.encode(codec.encode(utf8.encode(data)));
  }

  @override
  String decrypt(String data) {
    return utf8.decode(codec.decode(base64.decode(data)));
  }
}
