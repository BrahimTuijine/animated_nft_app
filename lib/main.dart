import 'package:animated_nft_app/core/constants/constants.dart';
import 'package:animated_nft_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme().copyWith(backgroundColor: kPinkColor),
      ),
      home: const HomePage(),
    );
  }
}
