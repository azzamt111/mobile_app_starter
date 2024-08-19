import 'package:flutter/material.dart';
import 'package:mobile_starter/feature/presentation/widgets/test_widget.dart';

class ServiceTestScreen extends StatefulWidget {
  const ServiceTestScreen({super.key});

  @override
  State<ServiceTestScreen> createState() => _ServiceTestScreenState();
}

class _ServiceTestScreenState extends State<ServiceTestScreen> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            TestWidget(
              size: size, 
              buttonText: "getTasks", 
              submitFunction: submitFunction
            )
          ],
        )
      )
    );
  }

  Future<void> submitFunction(bool param) async {
    //do something;
  }
}