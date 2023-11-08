import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pointycastle/export.dart';

class AESEncrypt {
  final String characterEncoding = "UTF-8";
  final String cipherTransformation = "AES/CBC/PKCS5Padding";
  final String aesEncryptionAlgorithm = "AES";

  // Uint8List decrypt(
  //     Uint8List cipherText, Uint8List key, Uint8List initialVector) {
  //   final cipher = CryptoUtils.getCipherInstance(cipherTransformation);
  //   final secretKeySpec = new KeyParameter(key);
  //   final ivParameterSpec = new ParametersWithIV(secretKeySpec, initialVector);
  //   cipher.init(false, ivParameterSpec);
  //   return cipher.process(cipherText);
  // }

  Uint8List encrypttt(
      Uint8List plainText, Uint8List key, Uint8List initialVector) {
    // final cipher = CBCBlockCipher(

    // );
    //  CryptoUtils.getCipherInstance(cipherTransformation);
    final cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      CBCBlockCipher(AESEngine()),
    )..init(
        true, // decrypt
        PaddedBlockCipherParameters(
          ParametersWithIV(KeyParameter(key), initialVector),
          null,
        ),
      );
    // final secretKeySpec = KeyParameter(key);
    // final ivParameterSpec = ParametersWithIV(secretKeySpec, initialVector);

    return cipher.process(plainText);
  }

  Uint8List getKeyBytes(String key) {
    final keyBytes = Uint8List(16);
    final parameterKeyBytes = utf8.encode(key);
    keyBytes.setRange(
        0, min(parameterKeyBytes.length, keyBytes.length), parameterKeyBytes);
    return keyBytes;
  }

  String encrypt(String plainText, String key) {
    final plainTextBytes = utf8.encode(plainText);
    final keyBytes = getKeyBytes(key);
    return base64.encode(
        encrypttt(Uint8List.fromList(plainTextBytes), keyBytes, keyBytes));
  }

  // String decrypt(String encryptedText, String key) {
  //   final cipheredBytes = base64.decode(encryptedText);
  //   final keyBytes = getKeyBytes(key);
  //   return utf8.decode(decrypt(cipheredBytes, keyBytes, keyBytes));
  // }
}

class Encrypt {
  static String encryptStringResponse(String stringResponse) {
    String encryptedText = "";
    const key = "Dena%sS4YtiXc&a1";

    try {
      final aesEncrypt = AESEncrypt();
      encryptedText = aesEncrypt.encrypt(stringResponse, key);
      print("klfsk...$encryptedText");
    } catch (e) {
      print(e);
    }
    return encryptedText.toString();
  }

  static String encryptJsonObjectResponse(String jsonResponse) {
    const key = "Dena%sS4YtiXc&a1";
    final keyWithDate = getCurrentDate() + key;
    print("mykeywithdate...$keyWithDate");
    String encryptedText = "";
    try {
      final aesEncrypt = AESEncrypt();
      encryptedText = aesEncrypt.encrypt(jsonResponse, keyWithDate);
      print("my encripted data....$encryptedText");
    } catch (e) {
      print(e);
    }
    return encryptedText;
  }

  static String getCurrentDate() {
    final requiredDate = getFormattedDate("MMddyy");
    final addedDate = getFormattedDate("yyyy");
    return addedDate.substring(0, 2) + requiredDate;
  }

  static String getFormattedDate(String format) {
    final dateFormat = DateFormat(format);
    final date = DateTime.now();
    return dateFormat.format(date);
  }
}
