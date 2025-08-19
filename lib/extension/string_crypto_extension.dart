import 'dart:convert';

import 'package:encrypt/encrypt.dart';

extension StringCryptoExtension on String {
  String aesEncrypt(String keyString) {
    final keyString32 = keyString.length > 32 
      ? keyString.substring(0, 32)
      : keyString.padLeft(32, "0");
    final key = Key.fromUtf8(keyString32);

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0,32));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);

    final encrypted = encrypter.encrypt(this);

    return encrypted.base64;
  }

  String aesDecrypt(String keyString) {
    final keyString32 = keyString.length > 32 
      ? keyString.substring(0, 32)
      : keyString.padLeft(32, "0");
    final key = Key.fromUtf8(keyString32);

    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0,32));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    final decrypted = encrypter.decrypt64(this);

    return decrypted;
  }
}