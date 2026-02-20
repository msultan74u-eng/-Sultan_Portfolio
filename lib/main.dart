import 'package:flutter/material.dart';
import 'package:sultan_portfolio/views/home_page.dart';

void main() {
  runApp(const Sultan_Portfolio());
}

class Sultan_Portfolio extends StatelessWidget {
  const Sultan_Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mohamed Sultan',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(title: 'Mohamed Sultan'),
    );
  }
}
