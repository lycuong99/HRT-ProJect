import 'dart:convert';

import 'package:flutter/services.dart';

class LocalAssetsHelper {
  static Future<String> _loadFromAsset(String url) async {
    return await rootBundle.loadString(url);
  }

  static Future _parseJson(String urlResource) async {
    String jsonString = await _loadFromAsset(urlResource);
    final jsonResponse = jsonDecode(jsonString);
    return jsonResponse;
  }

  static Future getDataFromAssets(String urlResource) async {
    return await _parseJson(urlResource);
  }
}
