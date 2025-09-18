import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/services/local_service.dart';
import 'package:taskati/core/utils/theme.dart';
import 'package:taskati/features/splash/pages/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await LocalHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: LocalHelper.userBox.listenable(),
        builder: (context, box, child) {
          bool isDark = box.get(LocalHelper.kIsdark) ?? false;
          return MaterialApp(home: Splash(), debugShowCheckedModeBanner: false, themeMode: isDark ? ThemeMode.dark : ThemeMode.light, darkTheme: AppTheme.darktheme, theme: AppTheme.lighttheme);
        });
  }
}
