
import 'package:gofly/app/my_app.dart';
import 'package:gofly/core/data/repositories/shared_preferences_repositories.dart';
import 'package:gofly/splashscreen.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref;
  },
  );

  Get.put(SharedPreferencesRepositories());
  // Get.put(LocationService());

  runApp(const MyApp());
}



