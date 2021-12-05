import 'package:flutter/material.dart';
import 'package:nike_shoes_store/main.dart';
import 'package:nike_shoes_store/models/nike_shoes.dart';
import 'package:nike_shoes_store/widgets/shake_transition_animation.dart';

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoesItem;
  final VoidCallback doOnTap;
  const NikeShoesItem({
    Key? key,
    required this.shoesItem,
    required this.doOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return InkWell(
      onTap: doOnTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: 'background_${shoesItem.model}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(shoesItem.color),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'number_${shoesItem.model}',
                  child: ShakeTransition(
                    axis: Axis.horizontal,
                    duration: Duration(milliseconds: 1000),
                    child: SizedBox(
                      height: itemHeight * 0.7,
                      child: Material(
                        color: Colors.transparent,
                        child: FittedBox(
                          child: Text(
                            shoesItem.modelNumber.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.05),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 100,
                height: itemHeight * 0.65,
                child: Hero(
                  tag: 'image_${shoesItem.model}',
                  child: Image.asset(
                    shoesItem.images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      shoesItem.model,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${shoesItem.oldPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${shoesItem.currentPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
