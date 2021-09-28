import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/utils/network_utils/config.dart';

import 'main.dart';

Future<void> main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  WidgetsFlutterBinding.ensureInitialized();
  Config.appFlavor = Flavor.DEVELOPMENT;
  runApp(MyApp());
}
