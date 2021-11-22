import 'package:flutter/material.dart';

class NikeShoesDetails extends StatelessWidget {
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ValueListenableBuilder<bool>(
              valueListenable: notifierButtonsVisible,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      heroTag: 'fav_1',
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    Spacer(),
                    FloatingActionButton(
                      heroTag: 'fav_2',
                      backgroundColor: Colors.black,
                      child: Icon(Icons.shopping_bag_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                  left: 0,
                  right: 0,
                  bottom: value ? 0.0 : -kToolbarHeight,
                  duration: Duration(milliseconds: 200),
                  child: child!,
                );
              }),
        ],
      ),
    );
  }
}
