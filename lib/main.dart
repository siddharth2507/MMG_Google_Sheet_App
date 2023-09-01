import 'package:flutter/material.dart';
import 'package:flutter_google_sheet_example/home.dart';

import 'monument_model.dart';

void main() {
  runApp(
    MyApp(),
  );
}

MonumentModel monumentModel = MonumentModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
