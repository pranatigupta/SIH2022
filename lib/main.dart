import 'package:flutter/material.dart';
import 'package:sam_new/pages/LandingPage.dart';
import 'constants/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
