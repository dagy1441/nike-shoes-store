import 'package:flutter/material.dart';

class ShoesSizeButton extends StatelessWidget {
  final String text;
  const ShoesSizeButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        child: Text(
          'US $text',
          style: TextStyle(color: Colors.black),
        ),
        style: TextButton.styleFrom(
          primary: Colors.black,
          side: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
        onPressed: () {
          print('Pressed ----------');
        },
      ),
    );
  }
}
