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
      width: min(size.width/2, 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headerIcon(
            onTapFunction: (value) {
              //navigate to the new_page.dart using autorouter flutter
            }
          ),
        ],
      ) 
    );
  }

  Widget headerIcon({
    required ValueChanged<bool> onTapFunction,
    IconData iconData= Icons.task, 
    bool active= false
  }) {
    return InkWell(
      onTap: () {
        onTapFunction(false);
      },
      splashColor: Colors.black12,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: active? Colors.white : Colors.white10
        ),
        child: Icon(
          iconData,
          color: active
            ? Colors.black
            : Colors.white54
        )
      ),
    );
  }
}