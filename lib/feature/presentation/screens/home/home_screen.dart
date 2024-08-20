import 'package:flutter/material.dart';
import 'package:mobile_starter/feature/presentation/constants/colors.dart';
import 'package:mobile_starter/feature/presentation/screens/home/widgets/header.dart';


class HomeScreen extends StatefulWidget {
  final Size size;
  const HomeScreen({super.key, required this.size});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: widget.size.height,
        width: widget.size.width,
        color: TodoColor.themeColor,
        child: Column(
          children: [
            Header(size: widget.size)
          ],
        )
      )
    );
  }
}