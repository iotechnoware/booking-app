import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:gofly/ui/views/splach_screen/splash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ColorNotifire())],
      child:  GetMaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: Colors.black,
          body: SplashScreen(),
        ),
      ),
    );
  }
}

// Locale getLocal() {
//   if (storage.getAppLanguage() == 'ar') {
//     return Locale('ar', 'SA');
//   } else {
//     return Locale('en', 'US');
//   }
// }