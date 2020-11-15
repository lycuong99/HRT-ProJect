import 'package:flutter_config/flutter_config.dart';

class ConfigData {
  static get(key) {
    return FlutterConfig.get(key);
  }
}
