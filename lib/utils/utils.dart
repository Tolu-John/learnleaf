import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

import 'app_config.dart';

class Utils{

  static String generateUUID() {
    var uuid =  Uuid();
    return uuid.v4();
  }


  Uint8List _encrypt(String input, String key) {
    // Use HMAC (Hash-based Message Authentication Code) for encryption
    var hmac = Hmac(sha256, utf8.encode(key));
    return hmac.convert(utf8.encode(input)).bytes as Uint8List;
  }

  String _bytesToString(Uint8List encryptedBytes) {
    return encryptedBytes
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  String? encryptPassword(String password) {
    // Encrypt the  information
    Uint8List encryptedBytes = _encrypt(password, AppConfig.encryptionKey2);

    // Convert the encrypted bytes to a hexadecimal string
    String encryptedHex = _bytesToString(encryptedBytes);

    return encryptedHex;

  }



}