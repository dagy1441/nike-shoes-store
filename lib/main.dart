import 'package:flutter/material.dart';

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

class NikeShoesStoreHome extends StatelessWidget {
  const NikeShoesStoreHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/nike_logo.png',
                  height: 40,
                ),
              ],
            ),
          ),
          Positioned(
            //top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            height: 60,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: [
                  Expanded(child: Icon(Icons.home)),
                  Expanded(child: Icon(Icons.search)),
                  Expanded(child: Icon(Icons.favorite_border)),
                  Expanded(child: Icon(Icons.shopping_cart)),
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage: AssetImage('assets/images/feet.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
