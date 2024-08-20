import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_starter/feature/presentation/constants/text_styles.dart';

class Header extends StatelessWidget {
  final Size size;
  const Header({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          date(),
          action()
        ],
      ) 
    );
  }

  Widget date() {
    return SizedBox(
      height: 50,
      width: min(size.width/2, 250),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("August 2023", style: TodoTextStyle.main),
        ],
      )
    );
  }

  Widget action() {
    return SizedBox(
      height: 50,
      withh: 
    );
  }
}