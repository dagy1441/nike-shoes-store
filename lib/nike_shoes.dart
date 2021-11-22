class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.modelNumber,
    required this.color,
    required this.images,
  });
}

final shoes = [
  NikeShoes(
    model: 'AIR MAX 90 EZ BLACK',
    oldPrice: 299,
    currentPrice: 149,
    modelNumber: 90,
    color: 0xfff6f6f6,
    images: [
      'assets/images/shoes1_1.png',
      'assets/images/shoes1_2.png',
      'assets/images/shoes1_3.png',
    ],
  ),
  NikeShoes(
    model: 'AIR MAX 95 RED',
    oldPrice: 399,
    currentPrice: 349,
    modelNumber: 95,
    color: 0xfffeefef,
    images: [
      'assets/images/shoes2_1.png',
      'assets/images/shoes2_2.png',
      'assets/images/shoes2_3.png',
    ],
  ),
  NikeShoes(
    model: 'AIR MAX 98 FREE',
    oldPrice: 299,
    currentPrice: 149,
    modelNumber: 98,
    color: 0xffedf3fe,
    images: [
      'assets/images/shoes4_1.png',
      'assets/images/shoes4_2.png',
      'assets/images/shoes4_3.png',
    ],
  ),
  NikeShoes(
    model: 'AIR MAX 270 GOLD',
    oldPrice: 259,
    currentPrice: 159,
    modelNumber: 270,
    // color: 0xfffcf5eb,
    color: 0xFFFCF5EB,
    images: [
      'assets/images/shoes3_1.png',
      'assets/images/shoes3_2.png',
      'assets/images/shoes3_3.png',
    ],
  ),
];
