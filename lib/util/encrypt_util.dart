import "package:encrypt/encrypt.dart";

String encryption(String plainText) {

  final key = Key.fromLength(32);
  final iv = IV.fromLength(16);

  final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encryptor.encrypt(plainText, iv: iv);

  return encrypted.base64;
}