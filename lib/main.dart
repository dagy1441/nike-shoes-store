import 'package:flutter/material.dart';
import 'package:nike_shoes_store/widgets/nike_choes_store_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: NikeShoesStoreHome(),
    );
  }
}
