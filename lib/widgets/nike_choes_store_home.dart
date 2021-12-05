import 'package:flutter/material.dart';
import 'package:nike_shoes_store/main.dart';
import 'package:nike_shoes_store/models/nike_shoes.dart';
import 'package:nike_shoes_store/nike_shoes_details.dart';
import 'package:nike_shoes_store/widgets/nike_shoes_item.dart';

class NikeShoesStoreHome extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: NikeShoesDetails(shoes: shoes),
        );
      }),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/nike_logo.png',
                  height: 50,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 20),
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      final shoesItem = shoes[index];
                      return NikeShoesItem(
                        shoesItem: shoesItem,
                        doOnTap: () {
                          _onShoesPressed(shoesItem, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierBottomBarVisible,
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
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  right: 0,
                  bottom: value ? 0.0 : -kToolbarHeight,
                  left: 0,
                  height: kToolbarHeight,
                  child: child!,
                );
              }),
        ],
      ),
    );
  }
}
