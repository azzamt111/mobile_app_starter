import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  final Size size;
  final String buttonText;
  final ValueChanged<bool> submitFunction;
  const TestWidget({
    super.key, 
    required this.size,
    required this.buttonText,
    required this.submitFunction
  });

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  bool isLoading= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: widget.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 200,
            margin: const EdgeInsets.only(top: 30),
            child: FloatingActionButton(
              onPressed: () {
                widget.submitFunction(false);
              },
              backgroundColor: Colors.black,
              child: SizedBox(
                height: 30,
                width: 300,
                child: Center(
                  child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white) 
                  : Text(
                    widget.buttonText, 
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    )
                  )
                )
              )
            )
      )
        ],
      )
    );
  }
}