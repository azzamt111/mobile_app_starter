import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final Size size;
  const NewPage({super.key, required this.size});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: widget.size.height,
        width: widget.size.width,
        color: Colors.white,
        child: const Center(
          child: Text("This is new page")
        )
      )
    );
  }
}