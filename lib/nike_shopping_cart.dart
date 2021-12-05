import 'package:flutter/material.dart';

import 'package:nike_shoes_store/models/nike_shoes.dart';
import 'package:nike_shoes_store/widgets/shoes_size_button.dart';

const _buttonSizeWidth = 160.0;
const _buttonSizeHeight = 60.0;
const _buttonCircularSize = 60.0;
const _finalImageSize = 30.0;
const _imageSize = 120.0;

class NikeShoppingCart extends StatefulWidget {
  final NikeShoes shoes;
  NikeShoppingCart({Key? key, required this.shoes}) : super(key: key);

  @override
  _NikeShoppingCartState createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animationResize;
  Animation? _animationMouvementIn;
  Animation? _animationMouvementOut;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animationResize = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(
          0.0,
          0.3,
        ),
      ),
    );
    _animationMouvementIn = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(
          0.45,
          0.6,
        ),
      ),
    );
    _animationMouvementOut = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(
          0.65,
          1.0,
          curve: Curves.bounceOut,
        ),
      ),
    );
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    final size = MediaQuery.of(context).size;
    final currentImageSize = (_imageSize * _animationResize!.value).clamp(
      _finalImageSize,
      _imageSize,
    );
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            value * (size.height * 0.6),
          ),
          child: child,
        );
      },
      child: Container(
        height: ((size.height * 0.6) * (_animationResize!.value)).clamp(
          _buttonCircularSize,
          size.height * 0.6,
        ),
        width: (size.height * _animationResize!.value)
            .clamp(_buttonCircularSize, size.width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: _animationResize!.value == 1
                ? Radius.circular(0.0)
                : Radius.circular(30),
            bottomRight: _animationResize!.value == 1
                ? Radius.circular(0.0)
                : Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: _animationResize!.value == 1
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.shoes.images.first,
                    height: currentImageSize,
                  ),
                  if (_animationResize!.value == 1) ...[
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          widget.shoes.model,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '\$${widget.shoes.currentPrice.toInt().toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Divider(
              height: 10,
              //thickness: 2,
              //color: Colors.black12,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/feet.png',
                  height: 15,
                ),
                SizedBox(width: 20),
                Text('SELECT SIZE'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShoesSizeButton(text: '5'),
                ShoesSizeButton(text: '6'),
                ShoesSizeButton(text: '7'),
                ShoesSizeButton(text: '8'),
                ShoesSizeButton(text: '9'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          final buttonSizeWidth = (_buttonSizeWidth * _animationResize!.value)
              .clamp(_buttonCircularSize, _buttonSizeWidth);
          final panelSizeWidth = (size.width * _animationResize!.value)
              .clamp(_buttonCircularSize, size.width);
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    color: Colors.black87,
                  ),
                ),
              ),
              Positioned.fill(
                child: Stack(
                  children: [
                    if (_animationMouvementIn!.value != 1)
                      Positioned(
                        top: size.height * 0.4 +
                            (_animationMouvementIn!.value *
                                size.height *
                                0.473),
                        left: (size.width / 2) - (panelSizeWidth / 2),
                        width: panelSizeWidth,
                        child: _buildPanel(),
                      ),
                    Positioned(
                      bottom: 40.0 - (_animationMouvementOut!.value * 100),
                      left: (size.width / 2) - (buttonSizeWidth / 2),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(
                              0.0,
                              (value) * (size.height * 0.6),
                            ),
                            child: child,
                          );
                        },
                        child: InkWell(
                          onTap: () => _animationController!.forward(),
                          child: Container(
                            width: buttonSizeWidth,
                            height: (_buttonSizeHeight *
                                    _animationResize!.value)
                                .clamp(_buttonCircularSize, _buttonSizeHeight),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (_animationResize!.value == 1) ...[
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'ADD TO CART',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
