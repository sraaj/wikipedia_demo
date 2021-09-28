import 'package:dio/dio.dart';

enum Flavor { DEVELOPMENT, PRODUCTION, IMPLEMENTATION }

class Config {
  static Flavor appFlavor;

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return '';
      case Flavor.IMPLEMENTATION:
        return '';
      case Flavor.DEVELOPMENT:
      default:
        return '';
    }
  }
}
