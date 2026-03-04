import 'package:flutter/material.dart';
import 'package:sultan_portfolio/views/home_page.dart';

/// لازم يكون خارج main عشان نقدر نستخدمه في أي مكان
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
/// Global variables   ↑↑↑↑↑

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void main() {
  runApp(const SultanPortfolio());
}

class SultanPortfolio extends StatelessWidget {
  const SultanPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mohamed Sultan',

          /// Light Theme
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),

          /// Dark Theme
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),

          /// الربط هنا مهم جدًا
          themeMode: currentMode,

          home: const HomePage(title: 'Mohamed Sultan'),
        );
      },
    );
  }
}
